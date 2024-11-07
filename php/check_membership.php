<?php
$servername = "localhost";
$username = "tu_usuario";
$password = "tu_contraseña";
$dbname = "nombre_base_datos"; 

$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

session_start();
$user_id = $_SESSION['user_id']; 

$sql = "SELECT membership_expiration FROM users WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->bind_result($membership_expiration);
$stmt->fetch();
$stmt->close();
$conn->close();

$current_date = new DateTime();
$expiration_date = new DateTime($membership_expiration);
$interval = $current_date->diff($expiration_date);
$days_remaining = $interval->days;
$is_expiring_soon = $days_remaining <= 7 && $expiration_date > $current_date;

$response = [
    "expiresSoon" => $is_expiring_soon,
    "daysRemaining" => $is_expiring_soon ? $days_remaining : null
];

header('Content-Type: application/json');
echo json_encode($response);
?>
