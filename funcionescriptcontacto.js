function submitForm(event) {
    event.preventDefault(); // Evitar el envío del formulario
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const message = document.getElementById('message').value;

    // Validación simple
    if (name && email && message) {
        // Mostrar mensaje de éxito
        document.getElementById('successMessage').style.display = 'block';
        // Limpiar el formulario
        document.getElementById('contactForm').reset();
    } else {
        alert("Por favor, completa todos los campos.");
    }
}
