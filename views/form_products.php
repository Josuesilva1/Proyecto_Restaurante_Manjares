<div class="card border-0 shadow-sm mx-auto mt-5 mb-5" style="max-width: 700px; border-radius: 0.75rem; overflow: hidden;">
    <div style="height: 6px; background-color: #D9A404;"></div>
    <div class="card-body p-4 p-md-5">

        <div class="d-flex align-items-center gap-2 mb-4">
            <i class="bi bi-egg-fried fs-4" style="color:#D9A404;"></i>
            <h1 class="fs-4 fw-semibold mb-0" style="font-family:'Poppins',sans-serif; color:#2E1A12;">
                Agregar nuevo producto
            </h1>
        </div>

        <form action="" class="row needs-validation" novalidate>

            <div class="col-4">
                <label for="codigo" class="form-label">Código</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-upc"></i></span>
                    <input type="number" id="codigo" name="codigo" class="form-control" required>
                    <div class="invalid-feedback">
                        Por favor ingrese un código
                    </div>
                </div>
            </div>

            <div class="col-12 mt-3">
                <label for="nombre" class="form-label">Nombre</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-tag"></i></span>
                    <input type="text" id="nombre" name="nombre" class="form-control" required>
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
                            <input type="number" id="existencia" name="existencia" class="form-control">
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

            <div class="col-12 mt-5">
                <button class="btn w-100 py-2 fw-medium" type="submit" style="background-color:#2E1A12; color:#F7F5F2;">
                    Agregar producto
                </button>
            </div>
        </form>
    </div>
</div>