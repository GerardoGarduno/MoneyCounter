//import logo from '/assets/logo.jpeg';
import React from 'react';
import './webPages.css'
import logo from '../assets/logo.png';
import {useNavigate , BrowserRouter as Router, Route, Routes } from 'react-router-dom';

function homePage() {
  let navigate = useNavigate(); 
  const routeChange = () =>{ 
    let path = './walletPage'; 
    navigate(path);
  }
  const goCamera = () =>{ 
    let path = './cameraPage'; 
    navigate(path);
  }

  return (
    <div className="App">
      <div className="NavBar">
          <ul>
            <li className = "MoneyCounter" ><a>MoneyCounter</a></li>
          </ul>
      </div>
      <div className="centerBlock">
        <div className="chooseOption"><h3>Choose Option</h3> </div>
        <button className="groupofButton1" onClick={goCamera}>Camera</button>  
        <button className="groupofButton2" onClick={routeChange}
         >Virtual Wallet</button>
      </div>
      <img src={logo} className="logo" alt="logo" />

    </div>
  )
}

export default homePage;
