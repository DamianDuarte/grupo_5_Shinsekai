const cartContainer = document.querySelector('#cartDetail')

let content;

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
}

function updateList(data)
{
    cartContainer.innerHTML = '';

    data.forEach(item =>
    {
        cartContainer.innerHTML += `
        <div class="payment__main__info__amount__list__product" id='listProduct${item.data.id}'>
            <div class="payment__main__info__amount__list__product__column">
                <a href="http://localhost:4000/products/details/${item.data.id}"><h4>${item.data.name}</h4></a>
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
                <p id="paymentListTotal${item.data.id}">$ ${((item.data.price - (item.data.price / 100 * item.data.discount)) * item.qty).toFixed(2)}</p>
            </div>
        </div>
        `;
    })
}

fetch('/api/MICArt').then(response =>
{
    response.json().then(result =>
    {
        content = result.data;
        console.log(content);
        updateList(content);

    }).catch(error =>
    {
        console.log(error);
    })
}).catch(error =>
{
    console.log(error);
})