import React from 'react'
import { Route, createBrowserRouter, createRoutesFromElements, RouterProvider } from 'react-router-dom';
import { Categories } from '../pages/Categories';
import { Home } from '../pages/Home';
import { Products } from '../pages/Products';
import { Root } from '../pages/Root';
import { Users } from '../pages/Users';

const router = createBrowserRouter(
    createRoutesFromElements(
        <Route path='/' element={<Root/>}>
            <Route path='/' element={<Home/>}></Route>
            <Route path='/products' element={<Products/>}></Route>
            <Route path='/users' element={<Users/>}></Route>
            <Route path='/categories' element={<Categories/>}></Route>
        </Route>
    )
)

export const AppRouter = () => {
  return (
    <RouterProvider router={router}/>
  )
}
