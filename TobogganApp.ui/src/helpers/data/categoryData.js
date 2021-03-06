import axios from 'axios';
import { baseUrl } from './config.json';

const categoryUrl = `${baseUrl}/Categories`;

const GetAllCategories = () => new Promise((resolve, reject) => {
  axios.get(categoryUrl).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const GetCategoryProducts = () => new Promise((resolve, reject) => {
  axios.get(`${categoryUrl}/Products`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const GetCategoryData = (id) => new Promise((resolve, reject) => {
  axios.get(`${categoryUrl}/SellerTotalCategoryInventory/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

// eslint-disable-next-line
export default { GetAllCategories, GetCategoryProducts, GetCategoryData };
