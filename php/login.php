<?php
// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "membershipdatabase";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Comprobar si el formulario se ha enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Prepara y ejecuta la consulta para evitar inyecciones SQL
    $sql = "SELECT * FROM Cliente WHERE correo = ? AND contrasena = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    // Verificar si se encontró el usuario
    if ($result->num_rows > 0) {
        // Inicio de sesión exitoso
        echo "<script>alert('Inicio de sesión exitoso'); window.location.href = '../shop.html';</script>";
    } else {
        // Credenciales incorrectas
        echo "<script>alert('Correo o contraseña incorrectos'); window.location.href = '../Login.html';</script>";
    }

    // Cerrar el statement y la conexión
    $stmt->close();
}
$conn->close();
?>
