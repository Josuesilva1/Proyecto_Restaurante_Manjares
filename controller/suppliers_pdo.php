<?php
include 'DB_conection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    try {
        
        $conn->beginTransaction();

        $codigo = $_POST['codigo'] ?? '';
        $nombre = $_POST['nombre'] ?? '';
        $direccion = $_POST['direccion'] ?? '';
        $rtn = $_POST['rtn'] ?? '';
        $ciudad = $_POST['ciudad'] ?? '';
        $telefonos = $_POST['telefonos'] ?? []; 

        // insertar
        $sqlProveedor = "INSERT INTO Proveedor (codigo_proveedor, nombre, direccion, rtn, ciudad) 
                         VALUES (:codigo, :nombre, :direccion, :rtn, :ciudad)";
        
        $stmtProveedor = $conn->prepare($sqlProveedor);
        $stmtProveedor->execute([
            ':codigo' => $codigo,
            ':nombre' => $nombre,
            ':direccion' => $direccion,
            ':rtn' => $rtn,
            ':ciudad' => $ciudad
        ]);

        // Verificacion de los telefonps
        if (!empty($telefonos) && is_array($telefonos)) {
            $sqlTelefono = "INSERT INTO Telefono (id_telefono, numero, Proveedor_codigo_proveedor) 
                            VALUES (:id_telefono, :numero, :proveedor_codigo)";
            $stmtTelefono = $conn->prepare($sqlTelefono);

            foreach ($telefonos as $index => $num) {
                if (!empty(trim($num))) {
                    
                    $idTelefono = $codigo . '-' . ($index + 1);
                    
                    $stmtTelefono->execute([
                        ':id_telefono' => $idTelefono,
                        ':numero' => $num,
                        ':proveedor_codigo' => $codigo
                    ]);
                }
            }
        }

        $conn->commit();
        echo "<div class='alert alert-success mt-3'>¡Proveedor y teléfonos agregados exitosamente!</div>";

    } catch (PDOException $e) {
        // Revertir cambios si ocurre un error
        $conn->rollBack();
        echo "<div class='alert alert-danger mt-3'>Error de inserción: " . $e->getMessage() . "</div>";
    }
}
?>