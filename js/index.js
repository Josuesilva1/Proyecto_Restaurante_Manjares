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

    'use strict'

    const container = document.getElementById('telefonos-container')
    const addBtn = document.getElementById('add-telefono')

    if (addBtn && container) {
        addBtn.addEventListener('click', () => {
            const row = document.createElement('div')
            row.className = 'input-group mb-2 telefono-row'
            row.innerHTML = `
                <span class="input-group-text bg-white"><i class="bi bi-telephone"></i></span>
                <input type="tel" name="telefonos[]" class="form-control" placeholder="9999-9999">
                <button type="button" class="btn btn-outline-danger remove-telefono">
                    <i class="bi bi-trash"></i>
                </button>
            `
            container.appendChild(row)
        })

        container.addEventListener('click', (event) => {
            if (event.target.closest('.remove-telefono')) {
                event.target.closest('.telefono-row').remove()
            }
        })
    }
})()