<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
        <div class="card shadow-sm mx-auto mt-5 mb-5" style="max-width: 700px;">
            <div class="card-body p-4">
                <h1 class="text-center fs-3 fw-semibold mb-4 text-primary">AGREGAR NUEVO PRODUCTO</h1>
                <form action="" class="row mt-3">
                    <div class="col-3">
                        <label for="" class="form-label">Codigo</label>
                        <input type="number" class="form-control" required>
                        <div class="invalid-feedback">
                            Por Favor Ingrese un codigo
                        </div>
                    </div>

                    <div class="col-12 mt-3">
                        <label for="" class="form-label">Nombre</label>
                        <input type="text" class="form-control">
                    </div>

                    <div class="col-12">
                        <div class="row mt-3">
                            <div class="col-6">
                                <label for="" class="form-label">Ubicación</label>
                                <input type="text" class="form-control">
                            </div>
                            <div class="col-6">
                                <label for="" class="form-label">Existencia</label>
                                <input type="number" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="row mt-3">
                            <div class="col-6">
                                <label for="" class="form-label">Costo</label>
                                <input type="number" class="form-control">
                            </div>
                            <div class="col-6">
                                <label for="" class="form-label">Precio</label>
                                <input type="number" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="col-12 mt-5">
                        <button class="btn btn-primary px-4" type="submit">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>