console.log("Mica te amamos");

let actualCart = false;

let updateCart = (data) => {
    actualCart = data;
    const totalPrice = data.reduce((acc, product) => acc + product.data.price * product.qty, 0)
    const cartList = document.getElementById('cart__list');
    const cartOptions = document.getElementById('cartOptions');

    document.getElementById('cart__list').innerHTML = ''
    if (data.length == 0) {
        cartList.innerHTML = "<img src='/img/MICArtTriste.png' alt='' style='margin: 50px auto; display: block;'> <p style = 'color:#292F36;text-align: center;margin: 15px;font-size: 16px;'  >El carrito está vacío</p>"
        cartOptions.innerHTML = '';
    } else {
        data.forEach(product => {
            cartList.innerHTML += `
            <div class="cart__product">
                    <a href="http://localhost:4000/products/details/${product.data.id}">
                        <img src="${product.data.images[0].url}" alt="img-${product.data.name}">
                    </a>

                    <div class="cart__product__info">
                        <a href="http://localhost:4000/products/details/${product.data.id}">
                            <p>${product.data.name}</p>
                        </a>

                        <div class="cart__product__info__price">
                            <div class="cart__product__info__price__quantity">
                                <button class="button-plus" onclick="removeqty(${product.data.id})">-</button>
                                <input class="button-number" type="text" value="${product.qty}" id="itemCarrito" name="item" disabled>
                                <button class="button-min" onclick="addqty(${product.data.id})">+</button>
                            </div>
    
                            <p>$ ${(product.data.price - product.data.price / 100 * product.data.discount) * product.qty}</p>
                        </div>
                    </div>
                    
                    <button class="product--delete" onclick="removeItem(${product.data.id})"><i class="fa-solid fa-trash"></i></button>
                </div>
            `;
        });

        cartOptions.innerHTML = `
            <hr>
                
            <div class="cart__pago__total">
                <p class="cart__pago-total">Total</p>
                <p class="cart__pago__price" id="totalPrice">$ ${totalPrice}</p>
            </div>

            <div class="cart__pago__payment">
                <button><a href="/products/payment">Iniciar compra</a></button>
                <button onclick="removeAllItems()" style="color: var(--light_bg);">Vaciar Carrito</button>
            </div>
            `;
    }
}

let addToCart = async () => {

    try {
        let ProductUrl = parseInt(document.URL.substring(document.URL.lastIndexOf('/') + 1));
        let response = await fetch(`/api/MICArt/add/${ProductUrl}`)
        let result = await response.json()
        updateCart(result.data)
        document.getElementById("MICArt").style.display = "block";
    } catch (error) {
        console.log(error)
    }
}

let addqty = async (id) => {
    try {
        let response = await fetch(`/api/MICArt/addqty/${id}`)
        let result = await response.json()
        updateCart(result.data)
    } catch (error) {
        console.log(error)
    }
}

let removeqty = async (id) => {
    try {
        let response = await fetch(`/api/MICArt/removeqty/${id}`)
        let result = await response.json()
        updateCart(result.data)
    } catch (error) {
        console.log(error)
    }
}

let removeItem = async (id) => {
    try {
        let response = await fetch(`/api/MICArt/remove/${id}`)
        let result = await response.json()
        updateCart(result.data)
        console.log([result.data]);
    } catch (error) {
        console.log(error)
    }
}

let removeAllItems = async () => {
    try {
        let response = await fetch(`/api/MICArt/removeAll`)
        let result = await response.json()
        updateCart(result.data)
    } catch (error) {
        console.log(error)
    }
}


document.getElementById("modalTrigger--MICArt").addEventListener('click', async () => {
    try {
        let response = await fetch('/api/MICArt')
        let result = await response.json()

        if (result.ok) {
            updateCart(result.data)
        }
    } catch (error) {
        console.log(error)
    }

})

