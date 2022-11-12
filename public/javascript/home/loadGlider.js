//* Glider Obj
const glider = new Glider(document.querySelector('.glider'), 
{
    slidesToShow: 1,
    slidesToScroll: 1,
    draggable: false
})

//* Glider index
let globalIndex = 0; 

//* Custom bars for glider
const bannerBars = document.querySelectorAll('.bannerBar');

//* Custom arrows for glider
const prevArrow = document.getElementsByClassName("bannerPrev").item(0);
const nextArrow = document.getElementsByClassName("bannerNext").item(0);

//* Updates globalIndex, bannerBars and the gliderItem
const updateGliderIndex = (index) =>
{
    if(index == globalIndex || index < 0 || index > bannerBars.length - 1) return;

    bannerBars.item(globalIndex).className = "bannerBar";
    bannerBars.item(index).className = "bannerBar bannerBarSelected";
    glider.scrollItem(index, true);
    globalIndex = index;
}

//! Events

window.addEventListener('load', glider); //* Loads glider obj

for(const bar of bannerBars)
{
    bar.onclick = () => updateGliderIndex(bar.dataset.index);
}

prevArrow.onclick = () => updateGliderIndex(+globalIndex - 1);
nextArrow.onclick = () => updateGliderIndex(+globalIndex + 1);