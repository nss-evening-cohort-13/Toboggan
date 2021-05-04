import axios from 'axios';
import { baseUrl } from './config.json';

const userDataUrl = `${baseUrl}/Users`;

const getSingleUser = (id) => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const getSellerData = () => new Promise((resolve, reject) => {
  axios.get(`${userDataUrl}/seller-search`).then((response) => {
    const sellers = response.data;
    const sellerData = [];
    sellers.map((seller) => getSingleUser(seller.UserId).then((resp) => sellerData.push(resp)));
    resolve(sellerData);
  }).catch((error) => reject(error));
});

export default { getSellerData, getSingleUser };
