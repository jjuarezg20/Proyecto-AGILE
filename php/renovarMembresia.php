<?php
// Configuración de la conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "membershipdataBase";

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];

    // Consultar el cliente en la base de datos por correo
    $sql = "SELECT * FROM Cliente WHERE correo = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $correo);
    $stmt->execute();
    $result = $stmt->get_result();
    $cliente = $result->fetch_assoc();

    // Verificar la contraseña
    if ($cliente && password_verify($contrasena, $cliente['contrasena'])) {
        // Calcular nueva fecha de expiración (un año desde hoy)
        $nueva_fecha = date('Y-m-d', strtotime('+1 year'));

        // Actualizar la fecha de expiración en la tabla Cliente
        $update_sql = "UPDATE Cliente SET fecha_fin_membresia = ? WHERE correo = ?";
        $update_stmt = $conn->prepare($update_sql);
        $update_stmt->bind_param("ss", $nueva_fecha, $correo);
        if ($update_stmt->execute()) {
            echo "<script>alert('La membresía ha sido renovada exitosamente. Nueva fecha de expiración: $nueva_fecha');</script>";
        } else {
            echo "<script>alert('Error al renovar la membresía');</script>";
        }
    } else {
        echo "<script>alert('Correo o contraseña incorrectos');</script>";
    }
}

$conn->close();
?>