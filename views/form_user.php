<div class="row min-vh-100 g-0">

    <!-- Panel de marca -->
    <div class="col-lg-5 d-none d-lg-flex flex-column justify-content-between text-white p-5" style="background-color:#2E1A12;">
        <div>
            <div class="d-flex align-items-center gap-2 mb-5">
                <i class="bi bi-egg-fried fs-3" style="color:#D9A404;"></i>
                <span class="fs-4 fw-semibold" style="font-family:'Poppins',sans-serif;">Manjares de Honduras</span>
            </div>
            <h2 class="fw-semibold mb-3" style="font-family:'Poppins',sans-serif; max-width:380px;">
                El sabor de cada día, bajo control
            </h2>
            <p class="text-white-50" style="max-width:360px;">
                Registra los platos, acompañantes y el menú que se produce cada día en el restaurante.
            </p>
        </div>
        <p class="text-white-50 small mb-0">© 2026 Manjares de Honduras</p>
    </div>

    <!-- Panel del formulario -->
    <div class="col-lg-7 d-flex align-items-center justify-content-center p-4" style="background-color:#F7F5F2;">
        <div style="width:100%; max-width:420px;">
            <div class="d-flex d-lg-none align-items-center gap-2 mb-4">
                <i class="bi bi-egg-fried fs-3" style="color:#D9A404;"></i>
                <span class="fs-4 fw-semibold" style="font-family:'Poppins',sans-serif; color:#2E1A12;">Manjares de Honduras</span>
            </div>

            <h1 class="fs-3 fw-semibold mb-1" style="font-family:'Poppins',sans-serif; color:#2E1A12;">Crear cuenta</h1>
            <p class="text-secondary mb-4">Completa tus datos para acceder al sistema del restaurante.</p>

            <form action="" class="needs-validation" novalidate>

                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre completo</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white"><i class="bi bi-person"></i></span>
                        <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Ej. Juan Rodriguez" required>
                        <div class="invalid-feedback">Ingresa tu nombre completo</div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Correo electrónico</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white"><i class="bi bi-envelope"></i></span>
                        <input type="email" id="email" name="email" class="form-control" placeholder="correo@ejemplo.com" required>
                        <div class="invalid-feedback">Ingresa un correo válido</div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-6 mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-telephone"></i></span>
                            <input type="number" id="telefono" name="telefono" class="form-control" placeholder="9999-9999" required>
                            <div class="invalid-feedback">Requerido</div>
                        </div>
                    </div>
                    <div class="col-6 mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-geo-alt"></i></span>
                            <input type="text" id="direccion" name="direccion" class="form-control" placeholder="Ciudad" required>
                            <div class="invalid-feedback">Requerido</div>
                        </div>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="password" class="form-label">Contraseña</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white"><i class="bi bi-lock"></i></span>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Mínimo 8 caracteres" minlength="8" required>
                        <button class="btn btn-outline-secondary" type="button" id="toggle-password">
                            <i class="bi bi-eye"></i>
                        </button>
                        <div class="invalid-feedback">Debe tener al menos 8 caracteres</div>
                    </div>
                </div>

                <button type="submit" class="btn w-100 py-2 fw-medium" style="background-color:#D9A404; color:#2E1A12;">
                    Crear cuenta
                </button>
            </form>
        </div>
    </div>
</div>