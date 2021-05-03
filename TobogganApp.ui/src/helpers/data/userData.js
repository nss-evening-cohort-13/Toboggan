import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const getSingleUser = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const checkIfUserExistsInDB = (user) => {
  axios.get(`${userDataUrl}/${user?.uid}`).then((response) => {
    if (Object.values(response.data).length === 0) {
      axios.post(`${userDataUrl}`, user);
      console.warn('user posted');
    } else {
      console.warn('User already exists.');
    }
  }).catch((error) => console.warn(error));
};

const setCurrentUser = (userObj) => {
  const user = {
    Id: userObj.uid,
  };

  const loggedIn = window.sessionStorage.getItem('token');
  if (!loggedIn) {
    checkIfUserExistsInDB(user);
  }
  return user;
};

export default { getSingleUser, setCurrentUser };
