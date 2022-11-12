const favs = Array.from(document.getElementsByTagName('i')).filter(t => t.className.includes('favButton'));
const favIcon = "fa-solid fa-heart favButton clickable";
const unfavIcon = "fa-regular fa-heart favButton favButtonUnselected clickable";

favs.forEach((button, i) =>
{
    button.selected = false;
    button.onclick = () => 
    {
        button.selected = !button.selected;
        button.className = button.selected ? favIcon : unfavIcon;
    };
    /* button.onmouseenter = (event) =>
    {
        const tagParent = document.getElementsByClassName('tag').item(i);
        
    };
    button.onmouseleave = (event) =>
    {
        const tagParent = document.getElementsByClassName('tag').item(i);
    } */
});