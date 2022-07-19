class Footer extends HTMLElement 
{
    constructor() 
    {
      super();
    }
  
    connectedCallback() 
    {
      this.innerHTML = `
        <style>
          
        </style>
        <footer>
            <h1>Aqui va el footer. Luego será actualizado.</h1>
        </footer>
      `;
    }
  }
  
  customElements.define('footer-component', Footer);