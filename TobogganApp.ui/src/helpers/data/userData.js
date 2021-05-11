import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const getSingleUser = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const getShopOrderHistory = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/getShopOrderHistory/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const getPurchaseHistoyr = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/PurchaseHistory/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
})

const getFilteredSellers = (searchInput) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/seller-search`).then((response) => {
    const filteredSellers = response.data.filter((seller) => seller.FirstName.toLowerCase().includes(searchInput) || seller.LastName.toLowerCase().includes(searchInput));
    resolve(filteredSellers);
  })
    .catch((error) => reject(error));
});

export default { getSingleUser, getFilteredSellers, getShopOrderHistory };
