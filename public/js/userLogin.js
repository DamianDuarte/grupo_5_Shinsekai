console.log('Logueate perra');


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
    target.classList.add("invalid");
};

const validFields = (element, target) => {
    dq(element).innerText = null;
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


const verifyPassword = async (password) => {
    try {
        let response = await fetch("/api/users/verify-password", {
            method: "POST",
            body: JSON.stringify({
                email: userEmail,
                password: password,
            }),
            headers: {
                "Content-Type": "application/json",
            },
        });

        let result = await response.json();

        return !result.verified;
    } catch (error) {
        console.error;
    }
};

dq("formLogin").addEventListener("submit", function (e) {
    e.preventDefault();
    let error = false;

    const elements = this.elements;
    for (let i = 0; i < elements.length - 2; i++) {
        if (!elements[i].value.trim() || elements[i].classList.contains('invalid')) {
            elements[i].classList.add('invalid');
            error = true;
        }
    }

    console.log(elements, error)
    !error && this.submit()
})

$("username").addEventListener("blur", function ({ target }) {
    switch (true) {
      case !this.value.trim():
        msgErrors("errorusername", "No tienes nombre, sempai? (*ﾉωﾉ)", target);
        break;
      case this.value.trim().length < 2:
        msgErrors(
          "errorusername",
          "El nombre es muy corto onee-chan, no seas tan tímido (´・ω・`)",
          target
        );
        break;
      case !exRegs.exRegAlfa.test(this.value):
        msgErrors("errorusername", "A caso eres un modelo de robot? (; ･`д･´) ", target);
        break;
      default:
        validFields("errorusername", target);
        break;
    }
  });

dq("passLog").addEventListener("blur", async function ({ target }) {
    switch (true) {
        case !this.value.trim():
            msgErrors("erroruserpass", "La contraseña es obligatoria", target);
            break;
        case await verifyPassword(this.value):
            msgErrors("erroruserpass", "La contraseña es incorrecta", target);
            break;
        default:
            validFields("erroruserpass", target);
            break;
    }
});
