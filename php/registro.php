<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "membershipdatabase";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Datos de usuario
    $nombre = $_POST['nombre'];
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena']; // Encriptar contraseña
    $telefono = $_POST['telefono'];

    // Insertar en tabla Cliente
    $sql_cliente = "INSERT INTO Cliente (nombre, correo, contrasena, telefono) VALUES (?, ?, ?, ?)";
    $stmt_cliente = $conn->prepare($sql_cliente);
    $stmt_cliente->bind_param("ssss", $nombre, $correo, $contrasena, $telefono);

    if ($stmt_cliente->execute()) {
        // Si el registro de cliente fue exitoso, insertar datos de pago
        $numero_tarjeta = $_POST['cardNumber'];
        $nombre_tarjeta = $_POST['cardName'];
        $expiracion_tarjeta = $_POST['expirationDate'];
        $codigo_seguridad = $_POST['securityCode'];

        // Insertar en tabla registro_pago
        $sql_pago = "INSERT INTO registro_pago (numero_tarjeta, nombre_tarjeta, expiration_date, security_code) VALUES (?, ?, ?, ?)";
        $stmt_pago = $conn->prepare($sql_pago);
        $stmt_pago->bind_param("ssss", $numero_tarjeta, $nombre_tarjeta, $expiracion_tarjeta, $codigo_seguridad);

        if ($stmt_pago->execute()) {
            echo "Registro exitoso";
        } else {
            echo "Error en el registro de pago: " . $stmt_pago->error;
        }
        
        $stmt_pago->close();
    } else {
        echo "Error en el registro de cliente: " . $stmt_cliente->error;
    }

    $stmt_cliente->close();
}

$conn->close();
?>
