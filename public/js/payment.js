const cartContainer = document.querySelector('#cartDetail')

let content;

fetch('/api/MICArt').then(response =>
{
    response.json().then(result =>
    {
        content = result.data;
        console.log(content);
    }).catch(error =>
    {
        console.log(error);
    })
}).catch(error =>
{
    console.log(error);
})