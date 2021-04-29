import firebase from 'firebase/app';
import 'firebase/auth';

const getUid = () => firebase.auth().currentUser?.uid;

const loginClickEvent = (e) => {
  e.preventDefault();
  const provider = new firebase.auth.GoogleAuthProvider();
  firebase.auth().signInWithPopup(provider);
};

const logoutClickEvent = (e) => {
  e.preventDefault();
  firebase.auth().signOut();
};

export default { getUid, loginClickEvent, logoutClickEvent };
