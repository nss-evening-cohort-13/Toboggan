import React, { Component } from 'react';
import firebase from 'firebase/app';
import AuthData from '../../helpers/data/authData';

export default class Auth extends Component {
  state = {
    user: null,
    authed: null,
  };

  componentDidMount() {
    this.removeListener = firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.setState({ user });
      } else {
        this.setState({ user: false });
      }
    });
  }

  componentWillUnmount() {
    this.removeListener();
  }

  render() {
    const { user } = this.state;

    return (
      <>
      { !user ? <button className='nav-link btn btn-primary' onClick={(e) => AuthData.loginClickEvent(e)}>Login</button>
        : <>
      <img className="userInfo" src={user?.photoURL} alt={user?.displayName} />
      <div
        className='nav-link btn btn-danger'
        onClick={(e) => AuthData.logoutClickEvent(e)}
      >
        Logout
      </div>
      </>
      }
      </>
    );
  }
}
