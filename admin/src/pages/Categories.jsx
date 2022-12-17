import React, { useState, useEffect } from 'react'
import { Category } from '../components/Category'
import { fetchThis } from '../hooks/fetchThis';
import '../lists.css';

export const Categories = () => {
  const [categories, setCategories] = useState({
      loading: true,
      error: null,
      data: []
  });

  useEffect(() => {
      fetchThis('categories/?limit=9999')
          .then((response) =>
          {
              if(response.msg != 'success')
                  setCategories({ ...categories, error: response.msg })
              else
                  setCategories({ ...categories, loading: false, data: response.data })
          })
  }, []);

  return (
      <div className='list'>
          <h1>Categorías</h1>
          <div className='itemContainer'>
              {
                  categories.data
                      .map((category, i) => categories.loading ? (<p>Cargando...</p>) : (<Category { ...category } key={ category.name+i} />))
              }
          </div>
      </div>
  )
}
