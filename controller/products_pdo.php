<?php
include 'DB_conection.php';

if (isset($_POST['form_producto'])) {
    try {

        $codigo     = trim($_POST['codigo'] ?? '');
        $nombre     = trim($_POST['nombre'] ?? '');
        $ubicacion  = trim($_POST['ubicacion'] ?? '');
        $existencia = trim($_POST['existencia'] ?? '');
        $costo      = trim($_POST['costo'] ?? '');
        $precio     = trim($_POST['precio'] ?? '');

        if ($codigo === '' || $nombre === '' || $ubicacion === '' || $existencia === '' || $costo === '' || $precio === '') {
            throw new Exception('Todos los campos son obligatorios.');
        }

        if (!is_numeric($existencia) || !is_numeric($costo) || !is_numeric($precio)) {
            throw new Exception('Existencia, costo y precio deben ser valores numéricos.');
        }

        $sqlProducto = "INSERT INTO Producto (codigo_producto, nombre, ubicacion_bodega, existencia_actual, precio_costo, precio_venta) 
                        VALUES (:codigo, :nombre, :ubicacion, :existencia, :costo, :precio)";

        $stmtProducto = $conn->prepare($sqlProducto);
        $stmtProducto->execute([
            ':codigo'     => $codigo,
            ':nombre'     => $nombre,
            ':ubicacion'  => $ubicacion,
            ':existencia' => $existencia,
            ':costo'      => $costo,
            ':precio'     => $precio,
        ]);

        echo "
        <div class='toast-container position-fixed top-0 end-0 p-3' style='z-index: 1055;'>
            <div class='toast align-items-center text-bg-success border-0 show' role='alert' aria-live='assertive' aria-atomic='true'>
                <div class='d-flex'>
                    <div class='toast-body d-flex align-items-center gap-2'>
                        <i class='bi bi-check-circle-fill fs-5'></i>
                        <span>¡Producto agregado exitosamente!</span>
                    </div>
                    <button type='button' class='btn-close btn-close-white me-2 m-auto' data-bs-dismiss='toast' aria-label='Close'></button>
                </div>
            </div>
        </div>
        ";

    } catch (PDOException $e) {
        error_log($e->getMessage());
        echo "
        <div class='toast-container position-fixed top-0 end-0 p-3' style='z-index: 1055;'>
            <div class='toast align-items-center text-bg-danger border-0 show' role='alert' aria-live='assertive' aria-atomic='true'>
                <div class='d-flex'>
                    <div class='toast-body d-flex align-items-center gap-2'>
                        <i class='bi bi-exclamation-triangle-fill fs-5'></i>
                        <span>Ocurrió un error al agregar el producto.</span>
                    </div>
                    <button type='button' class='btn-close btn-close-white me-2 m-auto' data-bs-dismiss='toast' aria-label='Close'></button>
                </div>
            </div>
        </div>
        ";

    } catch (Exception $e) {
        echo "<div class='alert alert-warning mt-3'>" . $e->getMessage() . "</div>";
    }
}
?>