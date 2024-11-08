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
    $sql_cliente = "INSERT INTO cliente (nombre, correo, contrasena, telefono) VALUES (?, ?, ?, ?)";
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
            // Capturar todos los datos del formulario
            $nombre = $_POST['nombre'];
            $apellido = $_POST['lastName'];
            $correo = $_POST['correo']; // Asegúrate de que este nombre coincida con el atributo name del input
            $telefono = $_POST['telefono'];
            $idNumber = $_POST['idNumber'];
            $membresia = $_POST['club'];
        
            echo "<script>
                const userData = {
                    nombre: '$nombre',
                    apellido: '$apellido',
                    email: '$correo', // Usa 'email' en lugar de 'correo'
                    telefono: '$telefono',
                    id: '$idNumber',
                    membresia: '$membresia'
                };
                localStorage.setItem('userData', JSON.stringify(userData));
                window.location.href = 'paginaPersonal.html';
            </script>";
            exit(); // Asegura que el script se detenga después de la redirección
        } else {
            echo "Error en el registro de pago: " . $stmt_pago->error;
            die();
        }
        
        $stmt_pago->close();
    } else {
        echo "Error en el registro de cliente: " . $stmt_cliente->error;
        die();
    }

    $stmt_cliente->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member's Club</title>
    <link rel="stylesheet" href="CSS/nav_bar.css">
    <link rel="stylesheet" href="CSS/registro.css">
</head>
<body>
    <header>
        <!-- Top navigation bar -->
        <div class="top-nav">
            <div class="left">
                <img src="IMG/logo.jpg" alt="Logo" class="logo">
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Search for Products, brands and more...">
                <button><i class="fa fa-search"></i></button>
            </div>
            <div class="right">
                <span class="account"><i class="fa fa-user"></i> Account:</span>
                <button class="login-btn" onclick="window.location.href='Login.html'">Login</button>
            </div>
        </div>

        <!-- Bottom navigation bar -->
        <nav class="bottom-nav">
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="shop.html">Shop</a></li>
                <li><a href="Buy_Membership.html">Membership</a></li>
                <li><a href="paginaPersonal.html">My Account</a></li>
            </ul>
        </nav>
    </header>

    <section class="registration-section">
        <button class="back-button" onclick="window.location.href='Buy_Membership.html'">Back</button>
        <h2>Set up your New Membership</h2>
        <p>Please fill out the main member's information to start enjoying our exclusive club benefits.</p>
        <p>If you had a Membership before, you can <a href="#">renew your membership here</a></p>
    
        <form class="membership-form" id="combinedForm" method="POST">
            <h3>Membership Information</h3>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">* Name</label>
                    <input type="text" id="firstName" required name="nombre">
                </div>
                <div class="form-group">
                    <label for="lastName">* Last Name</label>
                    <input type="text" id="lastName" required name="lastName">
                </div>
            </div>
    
            <div class="form-row">
                <div class="form-group">
                    <label for="country">* Country</label>
                    <input type="text" id="country" value="El Salvador" disabled >
                </div>
                <div class="form-group">
                    <label for="club">* Preferred Membership</label>
                    <select id="club" name="club">
                        <option value="Diamond">Diamond</option>
                        <option value="Platinum">Platinum</option>
                        <option value="Business">Business</option>
                        <option value="Business Platinum">Business Platinum</option>
                    </select>
                </div>
            </div>
    
            <div class="form-row">
                <div class="form-group">
                    <label for="email">* Email</label>
                    <input type="email" id="email" required name="correo">
                </div>
            </div>
    
            <div class="form-row">
                <div class="form-group">
                    <label for="password">* Create Password</label>
                    <input type="password" id="password" required name="contrasena">
                </div>
            </div>
    
            <div class="form-row">
                <div class="form-group">
                    <label for="idNumber">* Government ID Number</label>
                    <input type="text" id="idNumber" required maxlength="9" name="idNumber">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">* Phone Number</label>
                    <div class="phone-input">
                        <span class="flag-icon">🇸🇻</span>
                        <input type="text" id="phoneNumber" placeholder="Phone Number" required maxlength="8" name="telefono">
                    </div>
                </div>
            </div>

            <h3>Payment Method</h3>
            <button type="button" class="add-card-button">+ Add new card</button>

            <div class="form-group">
                <label for="cardNumber">Card number</label>
                <input type="text" id="cardNumber" placeholder="Card number" required name="cardNumber">
            </div>

            <div class="form-group">
                <label for="cardName">Name on card</label>
                <input type="text" id="cardName" placeholder="Name on card" required name="cardName">
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="expirationDate">Expiration Date</label>
                    <input type="text" id="expirationDate" placeholder="MM / YY" required name="expirationDate">
                </div>
                <div class="form-group">
                    <label for="securityCode">Security Code (CVV/CVC)</label>
                    <input type="text" id="securityCode" placeholder="CVV/CVC" required name="securityCode">
                </div>
            </div>

            <button type="submit" id="submitBtn">Submit</button>
        </form>
    </section>

<script>


</script>

</body>

<footer class="footer">
    <p>&copy; 2024 Members Club. Todos los derechos reservados.</p>
</footer>

</html>
