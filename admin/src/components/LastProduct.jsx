import React, { useState, useEffect } from 'react'
import { fetchThis } from '../hooks/fetchThis';

export const LastProduct = () => {

    const [product, setProduct] = useState(
        {
            loading: true,
            error: null,
            data: {}
        }
    );

    let productImg;
    useEffect(() => {
        fetchThis('products/?limit=1&page=0&orderBy=created_at&sortType=DESC')
            .then((response) => {
                if(response.msg != 'success')
                {
                    setProduct({ ...product, error: response.msg});
                }
                else
                {
                    setProduct({ ...product, loading: false, data: response.data[0]});
                }
            })
    }, []);

    return (
        
        <div className="col-lg-6 mb-4">
            {
                    (product.loading) ? <p>Cargando...</p>
                    : (
                        <div className="card shadow mb-4">
                            <div className="card-header py-3">
                                <h5 className="m-0 font-weight-bold text-gray-800">Último producto agregado</h5>
                            </div>
                            <div className="card-body">
                                <div className="text-center">
                                    <img className="img-fluid px-3 px-sm-4 mt-3 mb-4" style={{width: '40rem'}} src={product.data.images[0].url} alt={ product.data.name }/>
                                </div>
                                <h1> { product.data.name } </h1>
                                <p> { product.data.description } </p>
                                <a className="btn btn-danger" target="_blank" href={`http://localhost:4000/products/details/${product.data.id}`}>Ir a detalle</a>
                            </div>
                        </div>
                    )
            }
        </div>
    )
}
