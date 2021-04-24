import axios from 'axios';
import { baseUrl } from './config.json';

const categoryUrl = `${baseUrl}/Categories`;

const GetAllCategories = () => new Promise((resolve, reject) => {
  axios.get(categoryUrl).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const GetQuantityOfProductsPerCategory = () => new Promise((resolve, reject) => {
  axios.get(`${categoryUrl}/ProductQuantity`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

// eslint-disable-next-line
export default { GetAllCategories, GetQuantityOfProductsPerCategory };
