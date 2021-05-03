import firebase from 'firebase/app';
import 'firebase/auth';
import UserData from './userData';

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
};

const logoutClickEvent = (e) => {
  e.preventDefault();
  window.sessionStorage.removeItem('token');
  firebase.auth().signOut();
  window.location.href = '/';
};

export default { getUid, loginClickEvent, logoutClickEvent };
