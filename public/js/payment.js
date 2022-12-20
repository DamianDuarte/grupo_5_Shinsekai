const cartContainer = document.querySelector('#cartDetail')

let content;
let images;

function getImages(data)
{
    fetch('/api/misc/productsImg', {
        method: 'POST',
        body: JSON.stringify(data),
        headers: {'Content-Type': 'application/json'}
    }).then(response =>
    {
        response.json().then(result =>
        {
            images = result.data;
            const firstProduct = document.querySelector('.productLink');
            const id = firstProduct.dataset.pid;
            const img = images.find((i) => i.id == id);
            img ? (document.querySelector('#productImg').src = img.url) : ''; 
        })
        .catch(error =>
        {
            console.log(error);
        })
    })
    .catch(error =>
    {
        console.log(error);
    })
}

function updateLinks()
{
    const imgPrev = document.querySelector('#productImg'); 
    const allLinks = document.querySelectorAll('.productLink');

    for (let i = 0; i < allLinks.length; i++) 
    {
        allLinks[i].addEventListener('mouseenter', (event) =>
        {
            if(images)
            {
                const id = allLinks[i].dataset.pid;
                const img = images.find((i) => i.id == id);
                img ? (imgPrev.src = img.url) : ''; 
            }
        });
    }
}

function updateTotal()
{
    const prices = document.getElementsByClassName('totalPrices');
    let totalPrices = 0;

    if(prices && prices.length > 0)
    {
        for (let i = 0; i < prices.length; i++) {
            totalPrices += +(prices[i].textContent.replace('$', '').trim());
        }
    }

    document.querySelector('#finalPrice').textContent = "$" + totalPrices;
}

function decreaseQty(id)
{
    removeqty(id);
    const quantity = document.querySelector('#itemQty' + id);
    quantity.textContent = +quantity.textContent - 1;
    const unit = document.querySelector('#unitPrice' + id);
    const total = document.querySelector('#paymentListTotal' + id);
    const totalAmount = +total.textContent.replace('$', '').trim();
    const unitAmount = +unit.textContent.replace('$', '').trim();

    total.textContent = "$" + (totalAmount - unitAmount).toFixed(2);

    if(quantity.textContent == 0) document.querySelector('#listProduct' + id).remove();

    updateTotal();
}

function increaseQty(id)
{
    addqty(id);
    const quantity = document.querySelector('#itemQty' + id);
    quantity.textContent = +quantity.textContent + 1;
    const unit = document.querySelector('#unitPrice' + id);
    const total = document.querySelector('#paymentListTotal' + id);
    const totalAmount = +total.textContent.replace('$', '').trim();
    const unitAmount = +unit.textContent.replace('$', '').trim();

    total.textContent = "$" + (totalAmount + unitAmount).toFixed(2);
    updateTotal();
}

function updateList(data)
{
    cartContainer.innerHTML = '';

    data.forEach(item =>
    {
        cartContainer.innerHTML += `
        <div class="payment__main__info__amount__list__product" id='listProduct${item.data.id}'>
            <div class="payment__main__info__amount__list__product__column">
                <a class="productLink" data-pid="${item.data.id}" href="http://localhost:4000/products/details/${item.data.id}"><h4>${item.data.name}</h4></a>
                <p class="desktop-cantidad">Cantidad</p>
                <div class="amount">
                    <button onclick="decreaseQty(${item.data.id})">-</button>
                    <p id='itemQty${item.data.id}'>${item.qty}</p>
                    <button onclick="increaseQty(${item.data.id})">+</button>
                </div>
            </div>
            <div class="payment__main__info__amount__list__product__column">
                <h4 class="desktop-precio">Precio unitario</h4>
                <p id="unitPrice${item.data.id}">$ ${(item.data.price - (item.data.price / 100 * item.data.discount)).toFixed(2)}</p>
            </div>
            <div class="payment__main__info__amount__list__product__column">
                <h4 class="desktop-precio">Precio total</h4>
                <p class="totalPrices" id="paymentListTotal${item.data.id}">$ ${((item.data.price - (item.data.price / 100 * item.data.discount)) * item.qty).toFixed(2)}</p>
            </div>
        </div>
        `;
    });

    updateTotal();
    updateLinks();
}

fetch('/api/MICArt').then(response =>
{
    response.json().then(result =>
    {
        content = result.data;
        console.log(content);
        updateList(content);

        const imgData = { ids: [] };
        content.forEach(item => imgData.ids.push(item.data.id))
        getImages(imgData);

    })
    .catch(error =>
    {
        console.log(error);
    })
})
.catch(error =>
{
    console.log(error);
})