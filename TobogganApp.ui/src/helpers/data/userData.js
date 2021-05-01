import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const getSingleUser = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const checkIfUserExistsInDB = (user) => {
  getSingleUser(user.uid).then((response) => {
    if (Object.values(response.data).length === 0) {
      axios.post(`${userDataUrl}`, user);
      console.warn('user posted');
    } else {
      console.warn('User already exists.');
    }
  }).catch((error) => console.error(error));
};

const setCurrentUser = (userObj) => {
  const user = {
    FirstName: userObj.uid,
    // ImageUrl: userObj.photoURL,
    // FirebaseKey: userObj.uid,
    // Email: userObj.email,
  };

  const loggedIn = window.sessionStorage.getItem('token');
  if (!loggedIn) {
    checkIfUserExistsInDB(user);
  }
  return user;
};

export default { getSingleUser, setCurrentUser };
