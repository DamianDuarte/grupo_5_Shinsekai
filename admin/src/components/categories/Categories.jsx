import React, { useState, useEffect } from 'react'
import { useFetch } from '../../hooks/useFetch';
import { Category } from './Category'

export const Categories = () => {

    const [categories, setCategories] = useState({
        loading: true,
        error: null,
        data: []
    });
    useEffect(() => {
        useFetch('categories')
            .then((response) =>
            {
                if(response.msg != "success")
                    setCategories({ ...categories, error: response.msg })
                else
                    setCategories({ ...categories, loading: false, data: response.data })
            })
    }, [])

  return (
    <div className="col-lg-6 mb-4">						
        <div className="card shadow mb-4">
            <div className="card-header py-3">
                <h5 className="m-0 font-weight-bold text-gray-800">Categorías</h5>
            </div>
            <div className="card-body">
                <div className="row">
                    { categories.data
                        .map((category, i) => (<Category {...category } key={ category.name+i }/>)) }
                </div>
            </div>
        </div>
    </div>
  )
}
