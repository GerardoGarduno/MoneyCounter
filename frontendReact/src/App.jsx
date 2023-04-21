import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import homePage from './webPages/homePage';
import walletPage from './webPages/walletPage';
import cameraPage from './webPages/cameraPage';
function App() {

  return (
    <div className="App">
    <Router>
        <Routes>
          <Route exact path = '/' Component={homePage}/>
          <Route exact path = '/walletPage' Component= {walletPage}/>
          <Route exact path = '/cameraPage' Component={cameraPage}/>
        </Routes>
    </Router>


    </div>

  )
}

export default App;
