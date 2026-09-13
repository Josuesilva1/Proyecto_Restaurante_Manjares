(() => {
    'use strict'

    // Validación de formularios
    const forms = document.querySelectorAll('.needs-validation')

    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }
            form.classList.add('was-validated')
        }, false)
    })

    // Mostrar/ocultar contraseña
    const togglePassword = document.getElementById('toggle-password')

    if (togglePassword) {
        togglePassword.addEventListener('click', function () {
            const input = document.getElementById('password')
            const icon = this.querySelector('i')
            if (input.type === 'password') {
                input.type = 'text'
                icon.classList.replace('bi-eye', 'bi-eye-slash')
            } else {
                input.type = 'password'
                icon.classList.replace('bi-eye-slash', 'bi-eye')
            }
        })
    }
})()