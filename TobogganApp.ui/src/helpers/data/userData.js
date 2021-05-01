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
      axios.post(`${userDataUrl}`, user).then((resp) => {

      });
    }
  });
};

const setCurrentUser = (userObj) => {
  const user = {
    ImageUrl: userObj.photoURL,
    Id: userObj.uid,
    Email: userObj.email,
    lastSignInTime: userObj.metadata.lastSignInTime,
  };

  const loggedIn = window.sessionStorage.getItem('ua');
  if (!loggedIn) {
    checkIfUserExistsInDB(user);
  }
  return user;
};

export default { getSingleUser, setCurrentUser };
