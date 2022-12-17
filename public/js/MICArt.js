console.log("Mica te amamos");

let ActualCart = false;

let totalPrice = document.getElementById('totalPrice')


let updateCart = (data) => {
    totalPrice.textContent = data.reduce((acc, product) => acc + product.data.price * product.qty, 0)
    ActualCart = data;
    document.getElementById('cart__list').innerHTML = ''
    if (data.length == 0) {
        document.getElementById('cart__list').innerHTML = "<img src='/img/MICArtTriste.png' alt=''> <p style = 'color:#292F36'  >El carrito está vacío</p>"

    } else {
        data.forEach(product => {
            document.getElementById('cart__list').innerHTML += ` 
            <div class="product__container">
            <a href="#" class="cart__list__product">
            <img class="cart__list__product--img" src="${product.data.images[0].url}" alt="producto-img">
            <div class="cart__list--product-form">
            <div class="cart__list__product--name--price">
            <p class="product--name">${product.data.name}</p>
            <p class="product--price">$ ${product.data.price * product.qty}</p>
            </div>
            <div class="cart_list__form">
            <div class="cart__list--form">
            <button class="button-plus" onclick="removeqty(${product.data.id})">-</button>
            <input class="button-number" type="text" value="${product.qty}" id="itemCarrito" name="item" disabled>
            <button class="button-min" onclick="addqty(${product.data.id})">+</button>
            </div>
            <button class="product--delete" onclick="removeItem(${product.data.id})"><i class="fa-solid fa-trash"></i></button>
            </div>
            </div>
            </a>
            </div>  
            `
        }
        )
    }
}

let addToCart = async () => {

    try {
        let ProductUrl = parseInt(document.URL.substring(document.URL.lastIndexOf('/') + 1));
        let response = await fetch(`/api/MICArt/add/${ProductUrl}`)
        let result = await response.json()
        updateCart(result.data)


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

