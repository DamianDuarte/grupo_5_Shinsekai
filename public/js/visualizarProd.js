console.log("Las Banshees cantan");

let imgVis = document.getElementById("prodVis");
let imgUp = document.getElementById("images");
const imgContainer = document.querySelector('#arrayContainer');

function updateImg(imgIndex)
{
  const img = imgContainer.querySelector('#img-' + imgIndex).style.backgroundImage;
  const imgUrl = img.substring(img.indexOf("\"") + 1, img.lastIndexOf("\""));
  imgVis.src = imgUrl;
}

if(imgContainer.children.length > 1) imgContainer.style.display = 'flex';

imgUp.addEventListener("change", () => {
  const files = imgUp.files;

  if (!files || !files.length) {
    imgContainer.style.display = 'none'
    imgVis.src = "/img/products/default.png";
    return;
  }

  imgContainer.innerHTML = '';
  if(files.length > 1)
  {
    imgContainer.style.display = 'flex'
    for (let i = 0; i < files.length; i++) 
    {
      imgContainer.innerHTML += `
      <div id="img-${i}" class="product-thumbnail" style="background-image: url(${URL.createObjectURL(files[i])})" onclick="removeImg(${i})" onmouseenter="updateImg(${i})"'></div>
      `;
    }
  }
  else
  {
    imgContainer.style.display = 'none'
  }
  
  imgVis.src = URL.createObjectURL(files[0]);
});