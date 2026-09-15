<?php 
include '../includes.php'
?>

<div class="flex-fill d-flex flex-column justify-content-center px-4 px-md-5 py-4 position-relative">

    <div class="mx-auto" style="width:100%; max-width:420px;">

        <div class="d-flex align-items-center gap-2 mb-4">
            <h1 class="fs-4 fw-semibold mb-0" style="font-family:'Poppins',sans-serif; color:#2E1A12;">
                Agregar nuevo proveedor
            </h1>
        </div>

        <form action="" method="POST" class="row needs-validation" novalidate> // se uso el metodo POST 
            <div class="col-4">
                <label for="codigo-proveedor" class="form-label">Código</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-upc"></i></span>
                    <input type="number" id="codigo-proveedor" name="codigo" class="form-control" required>
                    <div class="invalid-feedback">
                        Por favor ingrese un código
                    </div>
                </div>
            </div>

            <div class="col-12 mt-3">
                <label for="nombre-proveedor" class="form-label">Nombre</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-building"></i></span>
                    <input type="text" id="nombre-proveedor" name="nombre" class="form-control" required>
                    <div class="invalid-feedback">
                        Por favor ingrese un nombre
                    </div>
                </div>
            </div>

            <div class="col-12 mt-3">
                <label for="direccion" class="form-label">Dirección</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-geo-alt"></i></span>
                    <input type="text" id="direccion" name="direccion" class="form-control" required>
                    <div class="invalid-feedback">
                        Por favor ingrese una dirección
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="row mt-3">
                    <div class="col-6">
                        <label for="rtn" class="form-label">RTN</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-card-text"></i></span>
                            <input type="text" id="rtn" name="rtn" class="form-control" placeholder="0000-0000-000000" required>
                            <div class="invalid-feedback">
                                Por favor ingrese el RTN
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="ciudad" class="form-label">Ciudad</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-signpost-2"></i></span>
                            <input type="text" id="ciudad" name="ciudad" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingrese la ciudad
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 mt-3">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <label class="form-label mb-0">Teléfonos</label>
                    <button type="button" id="add-telefono" class="btn btn-sm" style="color:#2E1A12; border: 1px solid #2E1A12;">
                        <i class="bi bi-plus-lg"></i> Agregar teléfono
                    </button>
                </div>

                <div id="telefonos-container">
                    <div class="input-group mb-2 telefono-row">
                        <span class="input-group-text bg-white"><i class="bi bi-telephone"></i></span>
                        <input type="tel" name="telefonos[]" class="form-control" placeholder="9999-9999" required>
                        <div class="invalid-feedback">
                            Ingrese al menos un teléfono
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 mt-4">
                <button class="btn w-100 py-2 fw-medium" type="submit" style="background-color:#2E1A12; color:#F7F5F2;">
                    Agregar proveedor
                </button>
            </div>
        </form>
    </div>
</div>