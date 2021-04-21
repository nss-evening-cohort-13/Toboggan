import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import Routes from '../helpers/Routes';
import Nav from '../Components/Nav';
import './App.scss';
import { GetAllShops } from '../helpers/data/shopData';

class App extends React.Component {
  render() {
    return (
      <div className='App'>
        <GetAllShops />
        <Router>
          <Nav />
          <Routes />
        </Router>
      </div>
    );
  }
}

export default App;
