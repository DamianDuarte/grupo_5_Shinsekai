import React from 'react'

export const User = (u) => {

  const img = u.avatar ? u.avatar.url : 'http://localhost:4000/api/users/img/default.jpeg';

  return (
    <div className='item'>
        <img src={img} alt={u.username}/>
        <p>{u.isAdmin ? (<b>[Admin]</b>) : ('')} { u.username }</p>
    </div>
  )
}
