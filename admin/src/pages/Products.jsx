import React, { useState, useEffect } from 'react'
import { Product } from '../components/Product'
import { useFetch } from '../hooks/useFetch';
import '../lists.css';

export const Products = () => {

    const [products, setProducts] = useState({
        loading: true,
        error: null,
        data: []
    });

    useEffect(() => {
        useFetch('products/?limit=9999')
            .then((response) =>
            {
                if(response.msg != 'success')
                    setProducts({ ...products, error: response.msg })
                else
                    setProducts({ ...products, loading: false, data: response.data })
            })
    }, []);

    return (
        <div className='list'>
            <h1>Productos</h1>
            <div className='itemContainer'>
                {
                    products.data
                        .map((product, i) => products.loading ? (<p>Cargando...</p>) : (<Product { ...product } key={ product.name+i} />))
                }
            </div>
        </div>
    )
}
