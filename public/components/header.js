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
          <i id="burger" class="fa-solid fa-bars"></i>
          <a href="#">
            <img src="/img/logo.png" alt="logo">
            <h1>Shinsekai</h1>
          </a>
        </figure>
  
          <form class="header__mitad__searchbar" action="">
            <select class="header__mitad__searchbar--filter" name="filtro" id="filtro">
              <option value="-1" disabled selected hidden>Filtro</option>
                <option value="1">heather</option>
                <option value="2">jeader</option>
                <option value="3">headher</option>
                <option value="4">header</option>
                <option value="5">jeadher</option>
                <option value="6">jheader</option>
                <option value="7">jheather</option>
            </select>
            <input class="header__mitad__searchbar--input" type="text" name="search" id="search" placeholder="Buscar">
            <button class="header__mitad__searchbar--button" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
          </form>
    
          <nav class="header__mitad__buttons">
            <a class="header__mitad__buttons__search"href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
            <a class="header__mitad__buttons__button" href="#"><i class="fa-solid fa-heart"></i></a>
            <a class="header__mitad__buttons__button" href="#"><i class="fa-solid fa-cart-shopping"></i></a>
            <a class="header__mitad__buttons__button" href="#"><i class="fa-solid fa-right-from-bracket"></i></a>
          </nav>
        </section>

        <section class="header__categorias">
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
          <a class="header__categorias--categoria" href="#">Categoría</a>
        </section>
      </header>
      `;
    }
  }
  
  customElements.define('header-component', Header);