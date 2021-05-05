import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const getSingleUser = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const getFilteredSellers = (searchInput) => new Promise((resolve, reject) => {
  axios.get(userDataUrl).then((response) => {
    const filteredSellers = response.data.filter((seller) => seller.firstName.toLowerCase().includes(searchInput) || seller.lastName.toLowerCase().includes(searchInput));
    resolve(filteredSellers);
  })
    .catch((error) => reject(error));
});

export default { getSingleUser, getFilteredSellers };
