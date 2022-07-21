class Header extends HTMLElement 
{
    constructor() 
    {
      super();
    }
  
    connectedCallback() 
    {
      this.innerHTML = `
      <header class="header">
        <section class="header__mitad">
          <figure class="header__mitad__logo">
            <img src="" alt="logo">
            <h1>Shinsekai</h1>
          </figure>
  
          <form class="header__mitad__searchbar" action="">
            <select class="header__mitad__searchbar--filter" name="filtro" id="filtro">
                <option value="1">heather</option>
                <option value="2">jeader</option>
                <option value="3">headher</option>
                <option value="4">header</option>
                <option value="5">jeadher</option>
                <option value="6">jheader</option>
                <option value="7">jheather</option>
            </select>
            <input class="header__mitad__searchbar--input" type="text" name="search" id="search">
            <button class="header__mitad__searchbar--button" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
          </form>
    
          <nav class="header__mitad__buttons">
            <a class="header__mitad__buttons__button" href="#"><img src="" alt="boton1"></a>
            <a class="header__mitad__buttons__button" href="#"><img src="" alt="boton2"></a>
            <a class="header__mitad__buttons__button" href="#"><img src="" alt="boton3"></a>
          </nav>
        </section>

        <section class="header__mitad">
          <ul class="header__mitad__categorias">
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
            <li class="header__mitad__categorias--categoria"><a href="#">Categoría</a></li>
          </ul>
        </section>
      </header>
      <hr>
      `;
    }
  }
  
  customElements.define('header-component', Header);