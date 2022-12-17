/* Agregar un boton para cambiar entre tema claro y oscuro */
console.log("Pinshi tema claro complicas las cosas");

const root = document.documentElement;


const button = document.getElementById('switchTheme');

const iconSwitch = document.getElementById('icon');

const updateTheme = (darkTheme) =>{
    if(darkTheme == 'darkTheme')
    {

        iconSwitch.classList.remove('fa-sun');
        iconSwitch.classList.add('fa-moon');

        root.style.setProperty('--c_header_footer', getComputedStyle(root).getPropertyValue('--dark_header_footer'))

        root.style.setProperty('--c_buttons', getComputedStyle(root).getPropertyValue('--dark_buttons'))

        root.style.setProperty('--c_squares', getComputedStyle(root).getPropertyValue('--dark_squares'))

        root.style.setProperty('--c_font', getComputedStyle(root).getPropertyValue('--dark_font'))

        root.style.setProperty('--c_bg', getComputedStyle(root).getPropertyValue('--dark_bg'))
    }
    else
    {
        

        iconSwitch.classList.remove('fa-moon');
        iconSwitch.classList.add('fa-sun');

        root.style.setProperty('--c_header_footer', getComputedStyle(root).getPropertyValue('--light_header_footer'))

        root.style.setProperty('--c_buttons', getComputedStyle(root).getPropertyValue('--light_buttons'))

        root.style.setProperty('--c_squares', getComputedStyle(root).getPropertyValue('--light_squares'))

        root.style.setProperty('--c_font', getComputedStyle(root).getPropertyValue('--light_font'))

        root.style.setProperty('--c_bg', getComputedStyle(root).getPropertyValue('--light_bg'))
    }

}

let themesChanges = async () =>{
    let response  = await fetch('http://localhost:4000/api/misc/getTheme')
    response = await response.json();
    let darkTheme = response.data;
    updateTheme(darkTheme);
    


    button.addEventListener('click', async () =>
    {
        let response= await fetch ('http://localhost:4000/api/misc/changeTheme');
        response = await response.json();
        let darkTheme = response.data;
        updateTheme(darkTheme);
    });
}
themesChanges();


