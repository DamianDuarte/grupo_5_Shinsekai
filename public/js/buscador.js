const search = (element) => document.getElementById(element);

search('form-search').addEventListener('submit', (e) => {
    e.preventDefault();


    
    const contenido = search('keywords');

    console.log(contenido);
    console.log(contenido.value.length);

    if(contenido.value.length > 0){
        e.target.submit();
    }
})