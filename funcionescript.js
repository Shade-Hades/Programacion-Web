// Carrusel de imágenes
let slideIndex = 0;
showSlides();

function showSlides() {
    const slides = document.getElementsByClassName("artwork");
    for (let i = 0; i < slides.length; i++) {
        slides[i].classList.remove("active"); // Ocultar todas las imágenes
    }
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1; }
    slides[slideIndex - 1].classList.add("active"); // Mostrar la imagen activa
    setTimeout(showSlides, 3000); // Cambia la imagen cada 3 segundos
}

function changeSlide(n) {
    slideIndex += n;
    const slides = document.getElementsByClassName("artwork");
    if (slideIndex > slides.length) { slideIndex = 1; }
    if (slideIndex < 1) { slideIndex = slides.length; }
    showSlides();
}

// Testimonios
let testimonialIndex = 0;
showTestimonials();

function showTestimonials() {
    const testimonials = document.getElementsByClassName("testimonial");
    for (let i = 0; i < testimonials.length; i++) {
        testimonials[i].classList.remove("active"); // Ocultar todos los testimonios
    }
    testimonialIndex++;
    if (testimonialIndex > testimonials.length) { testimonialIndex = 1; }
    testimonials[testimonialIndex - 1].classList.add("active"); // Mostrar el testimonio activo
    setTimeout(showTestimonials, 5000); // Cambia el testimonio cada 5 segundos
}

function changeTestimonial(n) {
    testimonialIndex += n;
    const testimonials = document.getElementsByClassName("testimonial");
    if (testimonialIndex > testimonials.length) { testimonialIndex = 1; }
    if (testimonialIndex < 1) { testimonialIndex = testimonials.length; }
    showTestimonials();
}

// Función para enviar el formulario
function submitForm(event) {
    event.preventDefault();
    alert("Formulario enviado. ¡Gracias por contactarnos!");
    document.getElementById("name").value = "";
    document.getElementById("email").value = "";
    document.getElementById("message").value = "";
}

// Mostrar/ocultar detalles de la tienda
function toggleShopDetails() {
    const details = document.querySelector('.shop-details');
    details.classList.toggle('active');
}
