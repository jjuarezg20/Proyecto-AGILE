<?php
$servername = "localhost";
$username = "tu_usuario";
$password = "tu_contraseña";
$dbname = "nombre_de_tu_base_de_datos";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener datos del formulario
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$email = $_POST['email'];
$id = $_POST['id'];
$telefono = $_POST['telefono'];
$membresia = $_POST['membresia'];

// Preparar y ejecutar la consulta SQL
$sql = "INSERT INTO usuarios (nombre, apellido, email, id, telefono, membresia) 
        VALUES ('$nombre', '$apellido', '$email', '$id', '$telefono', '$membresia')";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo registro creado exitosamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar conexión
$conn->close();
?>