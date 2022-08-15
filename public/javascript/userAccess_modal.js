let user_modal = document.getElementById("userAccess");
let user_btn = document.getElementById("modalTrigger--userAccess");
let user_span = document.getElementsByClassName("close--userAccess")[0];

//* Al hacer click en el boton, mostrar modal.
user_btn.onclick = function() {
  user_modal.style.display = "block";
}

//* Al hacer click sobre el span (x), cerrar el modal
user_span.onclick = function() {
  user_modal.style.display = "none";
}

//* Al hacer click fuera del contenido, cerrar el modal.
/* window.onclick = function(event) {
  if (event.target == user_modal) {
    user_modal.style.display = "none";
  }
} */

//* Al hacer click fuera del contenido, cerrar el modal.
window.addEventListener("click", function(event) {
  if (event.target == user_modal) {
    user_modal.style.display = "none";
  }
});