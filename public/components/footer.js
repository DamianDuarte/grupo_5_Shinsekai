class Footer extends HTMLElement 
{
    constructor() 
    {
      super();
    }
  
    connectedCallback() 
    {
      this.innerHTML = `
        <hr>
        <footer class="footer">
          <section class="footer__socialMedia">
            <h2>¡Siguenos</h2>
            <div class="footer__socialMedia__botones">
              <a class="footer__socialMedia__botones__boton" href="#"></a>
              <a class="footer__socialMedia__botones__boton" href="#"></a>
              <a class="footer__socialMedia__botones__boton" href="#"></a>
              <a class="footer__socialMedia__botones__boton" href="#"></a>
            </div>
            <h2>en las redes!</h2>
          </section>

          <section class="footer__elements">
            <div class="footer__elements__column">
              <h4>Título</h4>
              <ul class="footer__elements__column__links">
                <li><a>Elemento de footer</a></li>
                <li><a>Elemento de footer</a></li>
                <li><a>Elemento de footer</a></li>
              </ul>
            </div>
          </section>
          <section class="footer__elements">
            <div class="footer__elements__column">
              <h4>Título</h4>
              <ul class="footer__elements__column__links">
                <li><a>Elemento de footer</a></li>
                <li><a>Elemento de footer</a></li>
                <li><a>Elemento de footer</a></li>
              </ul>
            </div>
          </section>
          <section class="footer__elements">
            <div class="footer__elements__column">
              <h4>Título</h4>
              <ul class="footer__elements__column__links">
                <li><a>Elemento de footer</a></li>
                <li><a>Elemento de footer</a></li>
                <li><a>Elemento de footer</a></li>
              </ul>
            </div>
          </section>
          <section class="footer__elements">
            <div class="footer__elements__column">
              <h4>Título</h4>
              <ul class="footer__elements__column__links">
                <li><a>Elemento de footer</a></li>
                <li><a>Elemento de footer</a></li>
                <li><a>Elemento de footer</a></li>
              </ul>
            </div>
          </section>
        </footer>
      `;
    }
  }
  
  customElements.define('footer-component', Footer);