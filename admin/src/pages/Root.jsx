import React from 'react'
import { Outlet } from 'react-router-dom'
import { SideBar } from '../components/SideBar'
import { TopBar } from '../components/TopBar'
import { Footer } from '../components/Footer'
import { Home } from './Home'

export const Root = () => {
  return (
    <div id="wrapper">
        <SideBar/>

        <div id="content-wrapper" className="d-flex flex-column">
            
        <div id="content">
            
            <TopBar/>				
            <Outlet/>
                            
        </div>			

        <Footer/>

        </div>		
    </div>
  )
}
