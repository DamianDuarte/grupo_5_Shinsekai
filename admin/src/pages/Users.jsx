import React, { useState, useEffect } from 'react'
import { User } from '../components/User'
import { fetchThis } from '../hooks/fetchThis';
import '../lists.css';

export const Users = () => {
  const [users, setUsers] = useState({
      loading: true,
      error: null,
      data: []
  });

  useEffect(() => {
      fetchThis('users/?limit=9999')
          .then((response) =>
          {
              if(response.msg != 'success')
                  setUsers({ ...users, error: response.msg })
              else
                  setUsers({ ...users, loading: false, data: response.data })
          })
  }, []);

  return (
      <div className='list'>
          <h1>Usuarios</h1>
          <div className='itemContainer'>
              {
                  users.data
                      .map((user, i) => users.loading ? (<p>Cargando...</p>) : (<User { ...user } key={ user.name+i} />))
              }
          </div>
      </div>
  )
}
