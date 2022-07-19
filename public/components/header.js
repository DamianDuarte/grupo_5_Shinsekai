class Header extends HTMLElement 
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
        <header>
            <h1>Aqui va el header. Luego será actualizado.</h1>
        </header>
      `;
    }
  }
  
  customElements.define('header-component', Header);