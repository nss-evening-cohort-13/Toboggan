import axios from 'axios';
import { baseUrl } from './config.json';

const productsUrl = `${baseUrl}/Products`;

const getAllProducts = () => new Promise((resolve, reject) => {
  axios.get(productsUrl).then((response) => {
    resolve(response.data);
  })
    .catch((error) => reject(error));
});

const getSingleProduct = (id) => new Promise((resolve, reject) => {
  axios.get(`${productsUrl}/${id}`).then((response) => {
    resolve(response.data);
  })
    .catch((error) => reject(error));
});

const getFilteredProducts = (searchInput) => new Promise((resolve, reject) => {
  axios.get(`${productsUrl}`).then((response) => {
    const filteredData = response.data.filter((product) => product.filter.toLowerCase().includes(searchInput));
    resolve(filteredData);
  })
    .catch((error) => reject(error));
});

export default {
  getAllProducts,
  getSingleProduct,
};
