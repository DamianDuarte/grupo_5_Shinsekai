console.log("El registro anda Wachin");


let $ = (element) => document.getElementById(element);
const exReg = {
  exRegAlfa: /^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$/,
  exRegEmail: /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/,
  exRegPass:
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&=])[A-Za-z\d$@$!%*?&=]{6,8}/,
  exRegMayu: /[A-Z]/,
  exRegMinu: /[a-z]/,
  exRegNum: /[0-9]/,
  exRegEsp: /[$@$!%*?&=]/,
  exRegMin: /.{6,}/,
  exRegMax: /.{6,8}/,
};


let msgError = (element, msg, target) => {
    $(element).innerText = msg;
    target.classList.add("invalid");
};

let validField = (element, target) => {
    $(element).innerText = null;
    target.classList.remove("invalid");
    target.classList.add("valid");
};

let validPass = (element, exReg, value) => {
    if (!exReg.test(value)) {
        $(element).classList.add("invalid");
        $(element).classList.remove("valid");
    } else {
        $(element).classList.add("valid");
        $(element).classList.remove("invalid");
    }
};

let verifyEmail = async (email) => {
    try {
        let response = await fetch("/api/users/verify-email", {
            method: "POST",
            body: JSON.stringify({
                email: email,
            }),
            headers: {
                "Content-Type": "application/json",
            },
        });

        let result = await response.json();

        console.log(result);

        return result.verified;
    } catch (error) {
        console.error;
    }
}

let verifyUserName = async (username) => {
  try {
      let response = await fetch("/api/users/verify-username", {
          method: "POST",
          body: JSON.stringify({
              username : username
          }),
          headers: {
              "Content-Type": "application/json",
          },
      });

      let result = await response.json();

      

      return result.verified;
  } catch (error) {
      console.error;
  }
}

$("userName").addEventListener("blur", async function ({ target }) {
  switch (true) {
    case !this.value.trim():
      msgError("errorUsername", "No tienes nombre, sempai? (*ﾉωﾉ)", target);
      break;
    case this.value.trim().length < 2:
      msgError(
        "errorUsername",
        "El nombre es muy corto onee-chan, no seas tan tímido (´・ω・`)",
        target
      );
      break;
    case !exReg.exRegAlfa.test(this.value):
      msgError("errorUsername", "A caso eres un modelo de robot? (; ･`д･´) ", target);
      break;
      case await verifyUserName(this.value):
        msgError("errorUsername", "ALERTA DE DOPPELGANGER! o solo es coincidencia? Prueba otro nombre (´-ω-`)", target);
        break;
    default:
      validField("errorUsername", target);
      break;
  }
});

$("email").addEventListener("blur", async function ({ target }) {
  switch (true) {
    case !this.value.trim():
      msgError("errorEmail", "M...me das tu correo, sempai? (≧◇≦) ", target);
      break;
    case !exReg.exRegEmail.test(this.value):
      msgError("errorEmail", "ME QUIERES VER LA CARA DE ESTUPIDA!? el email esta mal", target);
      break;
    case await verifyEmail(this.value):
      msgError("errorEmail", "Deja un poco de lugar para los demas, tu ya estas dentro (´-ω-`)", target);
      break;
    default:
      validField("errorEmail", target);
      break;
  }
});

$("password").addEventListener("focus", () => {
  $("msgPass").hidden = false;
});

$("password").addEventListener("blur", function ({ target }) {
  $("msgPass").hidden = true;
  switch (true) {
    case !this.value.trim():
      msgError("errorPass", "Debes protegerte, onii-chan |ω・)", target);
      break;
/*      case !exReg.exRegPass.test(this.value):
      msgError(
        "errorPass",
        "Presta atencion. *La contraseña debe tener un símbolo, una número, una mayúscula, una minúscula y entre 6 y 8 caracteres. Hazlo bien, onii-chan （＾ω＾)",
        target
      ); //No anda, no funciona, rompe todo y encima me molesta. Conclucion. Lo saco alv
      break; */
    default:
      validField("errorPass", target);
      break;
  }
});

$("password").addEventListener("keyup", function ({ target }) {
  validPass("mayu", exReg.exRegMayu, target.value);
  validPass("minu", exReg.exRegMinu, target.value);
  validPass("num", exReg.exRegNum, target.value);
  validPass("esp", exReg.exRegEsp, target.value);
  validPass("min", exReg.exRegMin, target.value);
});

$("v_password").addEventListener("blur", function ({ target }) {
    switch (true) {
      case !this.value.trim():
        msgError("errorPass2", "Repitela para que se te grabe en tu cabeza distraida, sempai (∩´∀｀)∩", target);
        break;
      case this.value.trim() !== $('password').value.trim():
        console.log(this.value.trim(), $('password').value.trim());
        msgError(
          "errorPass2",
          "ACASO YA TE LA OLVIDASTE!? luego te quejas de que no te acuerdas de nada (´・ω・`)",
          target
        );
        break;
      default:
        validField("errorPass2", target);
        break;
    }
  });

  $('terms').addEventListener("click", function({target}) {

    validField('errorTerms', target)

  })

$("registerForm").addEventListener("submit", function (e) {

  e.preventDefault();
  let error = false;

  if(!$('terms').checked){
    error = true;
    $('errorTerms').innerText = "Debes aceptar las bases y condiciones";
    $('terms').classList.add('invalid')
  }



  const elements = this.elements;
    for (let i = 0; i < elements.length - 2; i++) {
        
        if(!elements[i].value.trim() || elements[i].classList.contains('invalid')){
            elements[i].classList.add('invalid')
           $('errorSubmit').innerText = 'Completa todo, se buen niño y no te olvides de nada (´・ω・`)';
           error = true;
        }
    }


  
  
  !error && this.submit()


});
$("btn-pass").addEventListener("click", ({ target }) => {
  if (target.localName === "i") {
    target.classList.toggle("fa-eye");
  $("password").type = $("password").type === "text" ? "password" : "text";
  } else {
    target.childNodes[0].classList.toggle("fa-eye");
    $("password").type = $("password").type === "text" ? "password" : "text";
  }
});
