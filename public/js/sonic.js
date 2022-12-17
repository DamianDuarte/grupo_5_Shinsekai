const root = document.documentElement;
console.log('fast af')

const getTheme = async () =>
{
    let theme = window.sessionStorage.getItem('theme');

    if(!theme)
    {
        try 
        {
            let response  = await fetch('http://localhost:4000/api/misc/getTheme')
            response = await response.json();
            theme = response.data;

            window.sessionStorage.setItem('theme', response.data);
        } 
        catch (error) 
        {
            console.log(error);
        }
    }
    
    return theme;

}

const updateTheme = async (theme = null) => {

    try
    {
        theme = theme ? theme : await getTheme();

        if(theme == 'darkTheme')
        {
            root.style.setProperty('--c_header_footer', getComputedStyle(root).getPropertyValue('--dark_header_footer'))
            root.style.setProperty('--c_buttons', getComputedStyle(root).getPropertyValue('--dark_buttons'))
            root.style.setProperty('--c_squares', getComputedStyle(root).getPropertyValue('--dark_squares'))
            root.style.setProperty('--c_font', getComputedStyle(root).getPropertyValue('--dark_font'))
            root.style.setProperty('--c_bg', getComputedStyle(root).getPropertyValue('--dark_bg'))
        }
        else
        {
            root.style.setProperty('--c_header_footer', getComputedStyle(root).getPropertyValue('--light_header_footer'))
            root.style.setProperty('--c_buttons', getComputedStyle(root).getPropertyValue('--light_buttons'))
            root.style.setProperty('--c_squares', getComputedStyle(root).getPropertyValue('--light_squares'))
            root.style.setProperty('--c_font', getComputedStyle(root).getPropertyValue('--light_font'))
            root.style.setProperty('--c_bg', getComputedStyle(root).getPropertyValue('--light_bg'))
        }
    }
    catch (error)
    {
        console.log(error);
    }
}

updateTheme();