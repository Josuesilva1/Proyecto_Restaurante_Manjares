<?php 
include './controller/products_pdo.php';
?>

<div class="flex-fill d-flex flex-column justify-content-center px-4 px-md-5 py-4 position-relative">

    <div class="mx-auto" style="width:100%; max-width:420px;">

        <div class="d-flex align-items-center gap-2 mb-4">
            <h1 class="fs-4 fw-semibold mb-0" style="font-family:'Poppins',sans-serif; color:#2E1A12;">
                Agregar nuevo producto
            </h1>
        </div>

        <form action="" method="POST" class="row needs-validation" novalidate>
            <input type="hidden" name="form_producto" value="1">
            <div class="col-4">
                <label for="codigo-producto" class="form-label">Código</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-upc"></i></span>
                    <input type="text" id="codigo-producto" name="codigo" class="form-control" required>
                    <div class="invalid-feedback">
                        Por favor ingrese un código
                    </div>
                </div>
            </div>

            <div class="col-12 mt-3">
                <label for="nombre-producto" class="form-label">Nombre</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-tag"></i></span>
                    <input type="text" id="nombre-producto" name="nombre" class="form-control" required>
                    <div class="invalid-feedback">
                        Por favor ingrese un nombre
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="row mt-3">
                    <div class="col-6">
                        <label for="ubicacion" class="form-label">Ubicación</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-geo-alt"></i></span>
                            <input type="text" id="ubicacion" name="ubicacion" class="form-control">
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="existencia" class="form-label">Existencia</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-boxes"></i></span>
                            <input type="text" id="existencia" name="existencia" class="form-control">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="row mt-3">
                    <div class="col-6">
                        <label for="costo" class="form-label">Costo</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white">L.</span>
                            <input type="number" id="costo" name="costo" class="form-control">
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="precio" class="form-label">Precio</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white">L.</span>
                            <input type="number" id="precio" name="precio" class="form-control">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 mt-4">
                <button class="btn w-100 py-2 fw-medium" type="submit" style="background-color:#2E1A12; color:#F7F5F2;">
                    Agregar producto
                </button>
            </div>
        </form>
    </div>
</div>