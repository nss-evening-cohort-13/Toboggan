import firebase from 'firebase/app';
import 'firebase/auth';
import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const getUid = () => firebase.auth().onAuthStateChanged((user) => {
  if (user) {
    console.warn(user.uid, 'user');
    return user.uid;
  }
  return console.warn('no user logged in.');
});

const loginClickEvent = (e) => {
  e.preventDefault();

  const provider = new firebase.auth.GoogleAuthProvider();
  firebase.auth().signInWithPopup(provider);

  console.warn(getUid(), 'uid-test');

  const user = {
    FirstName: 'test',
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
