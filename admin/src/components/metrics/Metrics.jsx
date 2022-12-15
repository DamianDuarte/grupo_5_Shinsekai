import React, { useState, useEffect } from 'react'
import { Metric } from './Metric'
import { fetchThis } from '../../hooks/fetchThis';

export const Metrics = () => {

    const [state, setstate] = useState(
        {
            loading: true,
            products: {
                title: 'Productos',
                color: 'primary',
                icon: 'fa-film',
                count: 0
            },
            users: {
                title: 'Usuarios',
                color: 'success',
                icon: 'fa-user',
                count: 0
            },
            categories: {
                title: 'Categorias',
                color: 'warning',
                icon: 'fa-award',
                count: 0
            }
        }
    );

    const getData = async(endpoint) => 
    {
        try
        {
            let response = await fetchThis(endpoint);
            setstate({
                loading: false,
                products: { ...state.products, count: response.data.products },
                users: { ...state.users, count: response.data.users },
                categories: { ...state.categories, count: response.data.categories }
            })
        }
        catch(err)
        {
            console.log(err)
        }
    }
    
    useEffect(() => {
        getData('misc/count')
    }, []);

  return (
    <div className="row">
        <Metric { ...state.products } key={'products'}/>
        <Metric { ...state.categories } key={'categories'}/>
        <Metric { ...state.users } key={'users'}/>
    </div>
  )
}
