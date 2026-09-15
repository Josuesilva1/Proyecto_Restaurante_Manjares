<?php
// Incluimos la conexión centralizada
include 'DB_conection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    try {
        // Recibir los datos del formulario de proveedores
        $codigo = $_POST['codigo'];
        $nombre = $_POST['nombre'];
        $direccion = $_POST['direccion'];
        $rtn = $_POST['rtn'];
        $ciudad = $_POST['ciudad'];
        
        // Manejar el array de teléfonos
        $telefonos = isset($_POST['telefonos']) ? implode(", ", $_POST['telefonos']) : '';

        // OJO AQUÍ: Usamos la tabla 'proveedor' y la columna 'codigo_proveedor'
        $sql = "INSERT INTO proveedor (codigo_proveedor, nombre, direccion, rtn, ciudad, telefono) 
                VALUES (:codigo, :nombre, :direccion, :rtn, :ciudad, :telefono)";
        
        $stmt = $conn->prepare($sql);
        
        // Ejecutamos pasando los valores
        $stmt->execute([
            ':codigo' => $codigo,
            ':nombre' => $nombre,
            ':direccion' => $direccion,
            ':rtn' => $rtn,
            ':ciudad' => $ciudad,
            ':telefono' => $telefonos
        ]);

        echo "<div class='alert alert-success mt-3'>¡Proveedor agregado exitosamente!</div>";

    } catch (PDOException $e) {
        echo "<div class='alert alert-danger mt-3'>Error de inserción: " . $e->getMessage() . "</div>";
    }
}
?>