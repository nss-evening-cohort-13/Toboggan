import React from 'react';
import firebase from 'firebase/app';
import { BrowserRouter as Router } from 'react-router-dom';
import Routes from '../helpers/Routes';
import Nav from '../Components/Nav';
import './App.scss';
import fbConnection from '../helpers/data/fbConnection';

fbConnection();

class App extends React.Component {
  state = {
    user: null,
  };

  componentDidMount() {
    this.removeListener = firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        user
          .getIdToken()
          .then((token) => sessionStorage.setItem('token', token));

        this.setState({ user });
        console.warn('test', user);
      } else {
        this.setState({ user: false });
      }
    });
  }

  componentWillUnmount() {
    this.removeListener();
  }

  render() {
    return (
      <div className='App'>
        <Router>
          <Nav />
          <Routes />
        </Router>
      </div>
    );
  }
}

export default App;
