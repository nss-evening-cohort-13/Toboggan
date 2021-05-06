import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const getSingleUser = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const getPurchaseHistory = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/getPurchaseHistory/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default { getSingleUser, getPurchaseHistory };
