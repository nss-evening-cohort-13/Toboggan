import axios from 'axios';
import { baseUrl } from './config.json';

const shopUrl = `${baseUrl}/Shop`;

const getAllShops = () => new Promise((resolve, reject) => {
  axios.get(shopUrl).then((response) => {
    console.warn('data', response.data);
    resolve(Object.values(response.data));
  }).catch((error) => reject(error));
});

export default { getAllShops };
