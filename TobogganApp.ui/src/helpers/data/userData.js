import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const fetchUserData = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const fetchSellerData = () => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/seller-search`).then((response) => {
    const sellers = response.data;
    console.warn('rep', response.data);
    const sellerData = [];
    const sellerArray = sellers.foreach((seller) => fetchUserData(seller.UserId));
    console.warn(sellerArray, 'selles arrray');
    sellerArray.map((seller) => sellerData.push(seller));
    resolve(sellerData);
  }).catch((error) => reject(error));
});

export default { fetchUserData, fetchSellerData };
