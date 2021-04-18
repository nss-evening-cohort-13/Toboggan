import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Nav from '../Components/Nav';
import './App.scss';

class App extends React.Component {
  render() {
    return (
      <div className="App">
        <Router>
          <Nav />
        </Router>
      </div>
    );
  }
}

export default App;
