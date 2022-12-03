const popular = document.querySelector('.popularSection');
const popProducts = document.querySelectorAll('.product');

popProducts.forEach(pr =>
    {
        pr.onmouseenter = (target) => { popular.style.setProperty('--popularBg', `${ pr.dataset.pic }`) }
    });

popular.onmouseleave = (target) => { popular.style.setProperty('--popularBg', 'none') }