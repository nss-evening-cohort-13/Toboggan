import axios from 'axios';
import { baseUrl } from './config.json';

const shopUrl = `${baseUrl}/Shop`;

const getAllShops = () => new Promise((resolve, reject) => {
  axios.get(shopUrl).then((response) => {
    resolve(Object.values(response.data));
  }).catch((error) => reject(error));
});

const getSingleShop = (id) => new Promise((resolve, reject) => {
  axios.get(`${shopUrl}/${id}`).then((response) => {
    resolve(Object.values(response.data));
  }).catch((error) => reject(error));
});

export default { getAllShops, getSingleShop };
