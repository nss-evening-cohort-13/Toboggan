import firebase from 'firebase/app';
import 'firebase/auth';
import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const getUid = () => firebase.auth().onAuthStateChanged((user) => user.uid);

const loginClickEvent = (e) => {
  e.preventDefault();
  const provider = new firebase.auth.GoogleAuthProvider();
  firebase.auth().signInWithPopup(provider);

  const user = {
    FirstName: 'Chris',
  };

  axios.post(`${userDataUrl}`, user);
};

const logoutClickEvent = (e) => {
  e.preventDefault();
  window.sessionStorage.removeItem('token');
  firebase.auth().signOut();
  window.location.href = '/';
};

export default { getUid, loginClickEvent, logoutClickEvent };
