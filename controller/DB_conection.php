<?php
$servername = "localhost";
$username = "root";
$password = "12345678";
$dbname = "restaurante_manjares";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Conecction failed: " . $e->getMessage();
}
?>
