console.log("Mica te amamos");

document.getElementById("modalTrigger--MICArt").addEventListener('click', async () => {
    try {
        let response = await fetch('/api/MICArt')
        let result = await response.json()

        if (result.ok) {

            if (result.data.length == 0) {
                document.getElementById('cart__list').innerHTML = "<img src='/img/MICArtTriste.png' alt=''> <p style = 'color:#292F36'  >El carrito está vacío</p>"

            } else {
                result.data.forEach(product => {

                    document.getElementById('cart__list').innerHTML = ` 
                    <div class="product__container">
                    <a href="#" class="cart__list__product">
                    <img class="cart__list__product--img" src="/img/products/${product.images[0].url}" alt="producto-img">
                    <div class="cart__list--product-form">
                    <div class="cart__list__product--name--price">
                    <p class="product--name">${product.data.name}</p>
                    <p class="product--price">$ ${product.data.price * product.qty}</p>
                    </div>
                    <div class="cart_list__form">
                    <form class="cart__list--form">
                    <button class="button-plus" onclick="removeqty()">-</button>
                    <input class="button-number" type="text" value="${product.qty}" id="itemCarrito" name="item" disabled>
                    <button class="button-min" onclick="addqty()">+</button>
                    </form>
                    <a class="product--delete"><i class="fa-solid fa-trash"></i></a>
                    </div>
                    </div>
                    </a>
                    </div>  
                    `
                }
                )
            }
        }
    } catch (error) {
        console.log(error)
    }

})