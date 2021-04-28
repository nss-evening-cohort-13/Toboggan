import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const fetchUserData = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const fetchSmallDetailsData = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/smalldetails/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default { fetchUserData, fetchSmallDetailsData };
