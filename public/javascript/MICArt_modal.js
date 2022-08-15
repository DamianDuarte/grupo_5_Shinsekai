let micart_modal = document.getElementById("MICArt");
let micart_btn = document.getElementById("modalTrigger--MICArt");
let micart_span = document.getElementsByClassName("close--MICArt")[0];

//* Al hacer click en el boton, mostrar modal.
micart_btn.onclick = function() {
  micart_modal.style.display = "block";
}

//* Al hacer click sobre el span (x), cerrar el modal
micart_span.onclick = function() {
  micart_modal.style.display = "none";
}

//* Al hacer click fuera del contenido, cerrar el modal.
window.addEventListener("click", function(event) {
  if (event.target == micart_modal) {
    micart_modal.style.display = "none";
  }
});