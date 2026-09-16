<?php
include 'DB_conection.php';

if (isset($_POST['form_proveedor'])) {
    try {
        $conn->beginTransaction();

        $codigo = $_POST['codigo'] ?? '';
        $nombre = $_POST['nombre'] ?? '';
        $direccion = $_POST['direccion'] ?? '';
        $rtn = $_POST['rtn'] ?? '';
        $ciudad = $_POST['ciudad'] ?? '';
        $telefonos = $_POST['telefonos'] ?? []; 

        // 1. Inserción del proveedor (MySQL se encarga de validar duplicados por la llave primaria)
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

        // 2. Verificación e inserción de teléfonos con formato 'telXX' y prefijo '+504'
        if (!empty($telefonos) && is_array($telefonos)) {
            $sqlTelefono = "INSERT INTO Telefono (id_telefono, numero, Proveedor_codigo_proveedor) 
                            VALUES (:id_telefono, :numero, :proveedor_codigo)";
            $stmtTelefono = $conn->prepare($sqlTelefono);

            // Consultar cuántos teléfonos existen en total para continuar la secuencia
            $stmtCount = $conn->query("SELECT COUNT(*) AS total FROM Telefono");
            $row = $stmtCount->fetch(PDO::FETCH_ASSOC);
            $siguienteNumero = (int)$row['total'];

            foreach ($telefonos as $num) {
                $numLimpio = trim($num);
                if (!empty($numLimpio)) {
                    $siguienteNumero++;
                    
                    // Generar ID secuencial ej: tel11, tel12...
                    $idTelefono = "tel" . str_pad($siguienteNumero, 2, "0", STR_PAD_LEFT);
                    
                    // Anteponer '+504 ' automáticamente si el usuario no lo escribió
                    if (strpos($numLimpio, '+504') !== 0) {
                        $numeroFinal = '+504 ' . $numLimpio;
                    } else {
                        $numeroFinal = $numLimpio;
                    }
                    
                    $stmtTelefono->execute([
                        ':id_telefono' => $idTelefono,
                        ':numero' => $numeroFinal,
                        ':proveedor_codigo' => $codigo
                    ]);
                }
            }
        }

        $conn->commit();
        echo "
        <div class='toast-container position-fixed top-0 end-0 p-3' style='z-index: 1055;'>
            <div class='toast align-items-center text-bg-success border-0 show' role='alert' aria-live='assertive' aria-atomic='true'>
                <div class='d-flex'>
                    <div class='toast-body d-flex align-items-center gap-2'>
                        <i class='bi bi-check-circle-fill fs-5'></i>
                        <span>¡Proveedor agregado exitosamente!</span>
                    </div>
                    <button type='button' class='btn-close btn-close-white me-2 m-auto' data-bs-dismiss='toast' aria-label='Close'></button>
                </div>
            </div>
        </div>
        ";

    } catch (PDOException $e) {
        $conn->rollBack();
        echo "
        <div class='toast-container position-fixed top-0 end-0 p-3' style='z-index: 1055;'>
            <div class='toast align-items-center text-bg-danger border-0 show' role='alert' aria-live='assertive' aria-atomic='true'>
                <div class='d-flex'>
                    <div class='toast-body d-flex align-items-center gap-2'>
                        <i class='bi bi-exclamation-triangle-fill fs-5'></i>
                        <span>Error de inserción: " . htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8') . "</span>
                    </div>
                    <button type='button' class='btn-close btn-close-white me-2 m-auto' data-bs-dismiss='toast' aria-label='Close'></button>
                </div>
            </div>
        </div>
        ";
    }
}
?>