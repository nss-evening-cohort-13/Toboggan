import React, { Component } from 'react';
import firebase from 'firebase/app';
import 'firebase/auth';

export default class Auth extends Component {
  loginClickEvent = (e) => {
    e.preventDefault();
    const provider = new firebase.auth.GoogleAuthProvider();
    firebase.auth().signInWithPopup(provider);
  };

  render() {
    return (
      <div className='Auth d-flex justify-content-center'>
        <button className='btn btn-primary' onClick={this.loginClickEvent}>
          Google Sign in
        </button>
      </div>
    );
  }
}
