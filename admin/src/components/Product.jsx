import React from 'react'

export const Product = (p) => {

  const img = (p.images && p.images.length > 0 && p.images[0]) ? 
    p.images[0].url : 'http://localhost:4000/api/products/img/default.png';

  return (
    <div className='item'>
        <img src={img} alt={p.name}/>
        <p>{ p.name }</p>
    </div>
  )
}
