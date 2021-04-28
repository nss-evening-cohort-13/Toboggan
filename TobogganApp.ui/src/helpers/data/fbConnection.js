import axios from 'axios';
import firebase from 'firebase';
import config from './config.json';

axios.interceptors.request.use(
  (request) => {
    const token = sessionStorage.getItem('token');

    if (token != null) {
      request.headers.Authorization = `Bearer ${token}`;
    }
    return request;
  },
  (err) => Promise.reject(err),
);

const firebaseApp = () => {
  firebase.initializeApp(config.firebaseConfig);
};

export default firebaseApp;
