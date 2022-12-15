/* Agregar un boton para cambiar entre tema claro y oscuro */

console.log("Pinshi tema claro complicas las cosas");

const root = document.documentElement;

const button = document.getElementById('switchTheme');

const iconSwitch = document.getElementById('icon');

console.log(root, iconSwitch);
let darkTheme = true;

button.addEventListener('click', () =>
{
    darkTheme = !darkTheme;
    if(darkTheme)
    {

        iconSwitch.classList.remove('fa-sun');
        iconSwitch.classList.add('fa-moon');

        root.style.setProperty('--c_header_footer', getComputedStyle(root).getPropertyValue('--dark_header_footer'))

        root.style.setProperty('--c_buttons', getComputedStyle(root).getPropertyValue('--dark_buttons'))

        root.style.setProperty('--c_squares', getComputedStyle(root).getPropertyValue('--dark_squares'))

        root.style.setProperty('--c_font', getComputedStyle(root).getPropertyValue('--dark_font'))
    }
    else
    {

        iconSwitch.classList.remove('fa-moon');
        iconSwitch.classList.add('fa-sun');

        root.style.setProperty('--c_header_footer', getComputedStyle(root).getPropertyValue('--light_header_footer'))

        root.style.setProperty('--c_buttons', getComputedStyle(root).getPropertyValue('--light_buttons'))

        root.style.setProperty('--c_squares', getComputedStyle(root).getPropertyValue('--light_squares'))

        root.style.setProperty('--c_font', getComputedStyle(root).getPropertyValue('--light_font'))
    }
});
