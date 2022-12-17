console.log("Este producto se autodestruira en 3 2 1");

let did = (element) => document.getElementById(element);


did("deleteForm").addEventListener("submit", function (e) {

  e.preventDefault();

      Swal.fire({
        title: 'Estas Seguro?',
        text: "Luego no hay marcha atras!!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, borralo!'
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            'Objetivo Eliminado!',
            'El producto fue eliminado.',
            'success'
            )
            this.submit()
        }else{
          Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Ta bien, no lo borramos nada ',
            showConfirmButton: false,
            timer: 1500
          }) 
        }
      })

  })


