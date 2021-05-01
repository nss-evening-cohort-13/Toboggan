import React, { Component } from 'react';
import 'firebase/auth';
import AuthData from '../../helpers/data/authData';

export default class Auth extends Component {
  render() {
    const user = AuthData.getUid();
    return (
      <>
      { !user ? <button className='nav-link btn btn-primary' onClick={AuthData.loginClickEvent}>Login</button>
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
