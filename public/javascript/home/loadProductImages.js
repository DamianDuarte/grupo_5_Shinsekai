const products = document.querySelectorAll('.product');

products.forEach(pr => pr.style.backgroundImage = pr.dataset.pic);