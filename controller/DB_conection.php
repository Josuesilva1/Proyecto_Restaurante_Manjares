<?php
$servername = "localhost";
$username = "root";
$password = "Pokemongo2016";
$dbname = "restaurante_manjares";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully"; 
} catch (PDOException $e) {
    echo "Conecction failed: " . $e->getMessage();
}
?>
