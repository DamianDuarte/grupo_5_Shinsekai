/* const $ = (element) => document.querySelector(element); */
console.log("o compras o te matamos");

const toValidate = document.querySelectorAll('.validateInput');
console.log([toValidate])

const regex = {
    regexAlfa: /^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$/,
    regexEmail: /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/,
    regexPass:  /^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[$@$!%?&=])[A-Za-z\d$@$!%?&=].{6,8}/,
    regexMayu: /[A-Z]/,
    regexMinu: /[a-z]/,
    regexNum: /[0-9]/,
    regexEsp: /[$@$!%*?&=]/,
    regexMin: /.{6,}/,
    regexMax: /^.{6,8}$/,
  };

const errorMsg = (element, msg, target) => {
    document.querySelector(element).innerText = msg;
    target.classList.add("invalid");
  };
  
const fieldValid = (element, target) => {
    document.querySelector(element).innerText = null;
    target.classList.remove("invalid");
    target.classList.add("valid");
};

document.querySelector('#name').addEventListener('blur', function({target})
{
    switch (true) {
        case !this.value.trim():
            errorMsg('#errorName', '* Debe introducir un nombre/titulo para el producto.', target);
            break;
        case this.value.trim().length < 5:
            errorMsg('#errorName', '* El nombre debe tener al menos 5 caracteres de largo.', target);
            break;
        case this.value.trim.length >= 75:
            errorMsg('#errorName', '* El nombre no debe superar los 75 caracteres.', target);
            break;
        default:
            fieldValid('#errorName', target)
            break;
    }
});

document.querySelector('#price').addEventListener('blur', function({target})
{
    switch (true) {
        case !this.value.trim():
            errorMsg('#errorPrice', '* Debe introducir un precio para el producto.', target);
            break;
        case !regex.regexNum.test(this.value):
            errorMsg('#errorPrice', '* El precio solo puede contener números.', target);
            break;
        case this.value.trim() < 0:
            errorMsg('#errorPrice', '* El precio no puede ser menor a cero.', target);
            break;
        default:
            fieldValid('#errorPrice', target);
            break;
    }
});

document.querySelector('#discount').addEventListener('blur', function({target})
{
    switch (true) {
        case this.value.trim() && !regex.regexNum.test(this.value):
            errorMsg('#errorDiscount', '* El descuento solo puede contener números.', target);
            break;
        case this.value.trim() < 0:
            errorMsg('#errorDiscount', '* El descuento no puede ser menor a cero.', target);
            break;
        default:
            fieldValid('#errorDiscount', target);
            break;
    }
});

document.querySelector('#description').addEventListener('blur', function({target})
{
    switch (true) {
        case !this.value.trim():
            errorMsg('#errorDescription', '* La descripción no puede estar vacía.', target);
            break;
        case this.value.trim().length < 20:
            errorMsg('#errorDescription', '* La descripción debe tener al menos 20 caracteres de largo.', target);
            break;
        default:
            fieldValid('#errorDescription', target);
            break;
    }
});

const imgExtensions = ['.jpg', '.jpeg', '.png', '.gif'];
const checkExtensions = files => 
{
    for (let i = 0; i < files.length; i++) {
        let flag = true;
        for(let e=0; e<imgExtensions.length; e++)
        {
            if(files[i].name.includes(imgExtensions[e]))
            {
                flag = false;
                break;
            }
        }

        if(flag) return false;
    }
    
    return true;
}
console.log([document.querySelector('#errorImages')])

document.querySelector("#images").addEventListener("change", function ({ target }) {
    console.log('reding image event')
    switch(true)
    {
      case !checkExtensions(target.files):
        errorMsg("#errorImages", "Solamente se aceptan las siguientes extensiones: " + imgExtensions.join(', '), target);
        break;
      default:
        fieldValid("#errorImages", target);
        break;
    }
  });


const form = document.querySelector('#addProduct');
form.addEventListener('submit', function(e)
{
    e.preventDefault();
    let error = false;
    
    toValidate.forEach(field =>
    {
        if(!field.value.trim() || field.classList.contains('invalid'))
        {
            field.classList.add('invalid');
            document.querySelector('#errorSubmit').innerText = 'Completa todo, se buen niño y no te olvides de nada (´・ω・`)';
            error = true;
        }
    })

    !error && this.submit();
});