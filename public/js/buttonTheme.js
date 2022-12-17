/* Agregar un boton para cambiar entre tema claro y oscuro */
console.log("Pinshi tema claro complicas las cosas");

const button = document.getElementById('switchTheme');
const iconSwitch = document.getElementById('icon');

const updateIcon = async () =>
{
    try 
    {
        const theme = await getTheme();

        if(theme == 'darkTheme')
        {
            iconSwitch.classList.remove('fa-sun');
            iconSwitch.classList.add('fa-moon');
        }
        else
        {
            iconSwitch.classList.remove('fa-moon');
            iconSwitch.classList.add('fa-sun');
        }

        iconSwitch.style.display = 'block';
    } 
    catch (error) 
    {
        console.log(error)   
    }
}

updateIcon();

const switchTheme = async () =>
{
    let response;

    try
    {
        response = await fetch ('http://localhost:4000/api/misc/changeTheme');
        response = await response.json();
        window.sessionStorage.setItem('theme', response.data);
    }
    catch (error)
    {
        console.log(error);
    }

    updateTheme();

    return response.data;
}

let themeChanges = async () =>{
    button.addEventListener('click', async () =>
    {
        try
        {
            await switchTheme();
            updateIcon();
        }
        catch (error)
        {
            console.log(error);
        }

    });
}

themeChanges();