console.log('Logueate perra');

const inputVal = document.querySelectorAll('.validateInput');



const dq = (element) => document.getElementById(element);

const exRegs = {
    exRegAlfa: /^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$/,
    exRegEmail: /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/,
    exRegPass: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,8}/,
    exRegMayu: /[A-Z]/,
    exRegMinu: /[a-z]/,
    exRegNum: /[0-9]/,
    exRegEsp: /[$@$!%*?&]/,
    exRegMin: /.{5,}/,
    exRegMax: /^.{5,10}$/,
};



const msgErrors = (element, msg, target) => {
    dq(element).innerText = msg;
    dq(element).classList.add("invalid");
    target.classList.add("invalid");
};

const validFields = (element, target) => {
    dq(element).innerText = null;
    dq(element).classList.remove("invalid");
    dq(element).classList.add("valid");
    target.classList.remove("invalid");
    target.classList.add("valid");
};

let validsPass = (element, exRegs, value) => {
    if (!exRegs.test(value)) {
        dq(element).classList.add("invalid");
        dq(element).classList.remove("valid");
    } else {
        dq(element).classList.add("valid");
        dq(element).classList.remove("invalid");
    }
};




$("username").addEventListener("blur", function ({ target }) {
    switch (true) {
        case !this.value.trim():
            msgErrors("errorusername", "No tienes nombre, sempai? (*ﾉωﾉ)", target);
            break;
        default:
            validFields("errorusername", target);
            break;
    }
});

dq("passLog").addEventListener("blur", async function ({ target }) {
    switch (true) {
        case !this.value.trim():
            msgErrors("erroruserpass", "La contraseña es obligatoria, acuerdate que te protegiste", target);
            break;
        default:
            validFields("erroruserpass", target);
            break;
    }
});
dq("formLogin").addEventListener("submit", function (e) {
    e.preventDefault();
    let error = false;

    inputVal.forEach(field => {
        if (!field.value.trim() || field.classList.contains('invalid')) {
            field.classList.add('invalid');
            document.querySelector('#errorSubmit').innerText = 'Completa todo, se buen niño y no te olvides de nada (´・ω・`)';
            error = true;
        }
    })


    console.log(inputVal, error)
    !error && this.submit()
});
dq("btn-show-pass").addEventListener("click", ({ target }) => {
    if (target.localName === "i") {
      target.classList.toggle("fa-eye");
    dq("passLog").type = dq("passLog").type === "text" ? "password" : "text";
    } else {
      target.childNodes[0].classList.toggle("fa-eye");
      dq("passLog").type = dq("passLog").type === "text" ? "password" : "text";
    }
  });