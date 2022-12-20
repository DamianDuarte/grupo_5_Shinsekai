const comments = document.querySelector('#comments');
const contentQA = document.querySelector('#content');
const errorQA = document.querySelector('#errorQA');

const reviews = document.querySelector('#reviews');
const contentReviews = document.querySelector('#contentReview');
const errorReviews = document.querySelector('#errorReview');

const productId = comments.dataset.productid;
const username = contentQA.dataset.user;
const avatarPath = contentQA.dataset.avatar;

let commentCount = comments.dataset.length;
let cooldown = false;

let changeKarmaColor = () =>
{
    const karmaList = document.getElementsByClassName('karma');
    for(let i=0; i < karmaList.length; i++)
    {
        if(karmaList[i].textContent.includes('+'))
        {
            console.log('if')
            karmaList[i].style.color = 'green';
        }
        else if(karmaList[i].textContent.includes('-'))
        {
            console.log('else')
            karmaList[i].style.color = 'red';
        }
    }
};

changeKarmaColor();

function addComment(comment)
{
    const tomoko = document.querySelector('#tomoko');
    if(tomoko)
        comments.innerHTML = '';

    console.log('comment', comment);
    comments.innerHTML += `
    <div class="${ comment.content.includes('>>#') ? "details__qa__comments__a" : "details__qa__comments__q" }">
        <p class="id">#${commentCount > 0 ? +commentCount + 1 : 1}</p>
        <img src="${ avatarPath }" alt="">
        <h5 class="username">${ comment.username }</h5>
        <p class="content">${ comment.content }</p>
    </div>
    `
    commentCount++;
}

function validateContent(content, errorMsg)
{
    if(cooldown)
    {
        errorMsg.style.color = 'red'
        errorMsg.textContent = '¡Wow, tranquilo amigo! Acabas de enviar un comentario... Aquí no toleramos el spam (´-ω-`)'
        return false;
    }

    if(!username)
    {
        errorMsg.style.color = 'red'
        errorMsg.textContent = '¡Necesitas logearte para poder comentar!'
        return false;
    }
    
    if(content.value.trim().length < 3)
    {
        errorMsg.style.color = 'red'
        errorMsg.textContent = '¡Tu pregunta debe contener al menos 3 caracteres!'
        return false;
    }

    errorMsg.textContent = '';
    return true;
}

function sendQuestion()
{
    if(!validateContent(contentQA, errorQA)) return;

    setTimeout(() =>
    {
        errorQA.textContent = '';
        cooldown = false;
    }, 5000);

    const data = 
    {
        content : contentQA.value.trim(),
        productId,
        username
    };

    fetch('/api/misc/comment', {
        method: 'POST',
        body: JSON.stringify(data),
        headers: {'Content-Type': 'application/json'}
    })
    .then(response =>
    {
        response.json().then(result =>
        {
            console.log('result', result);
            addComment(result.data);
        })
        .catch(error => 
        {
            console.log(error);
            errorQA.style.color = 'red';
            errorQA.textContent = error;
        });
    })
    .catch(error => 
    {
        console.log(error);
        errorQA.style.color = 'red';
        errorQA.textContent = error;
    });
    
    contentQA.value = '';
    errorQA.style.color = 'green'
    errorQA.textContent ='¡Comentario enviado con éxito!';
    cooldown = true;
}

contentQA.addEventListener('blur', (e) =>
{
    validateContent();
})