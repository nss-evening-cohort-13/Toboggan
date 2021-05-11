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

const getFilteredProductsBackEnd = (searchInput) => new Promise((resolve, reject) => {
  axios.get(`${productsUrl}/search/${searchInput}`).then((response) => {
    resolve(response.data);
  })
    .catch((error) => reject(error));
});

const getFilteredProducts = (searchInput) => new Promise((resolve, reject) => {
  axios.get(productsUrl).then((response) => {
    const filteredList = response.data.filter((product) => product.title.toLowerCase().includes(searchInput) || product.description.toLowerCase().includes(searchInput));
    resolve(filteredList);
  })
    .catch((error) => reject(error));
});

const getProductsOfAShop = (shopId) => new Promise((resolve, reject) => {
  axios.get(`${productsUrl}/singleShop/${shopId}`).then((response) => {
    resolve(Object.values(response.data));
  }).catch((error) => reject(error));
});

const updateProduct = (productObj) => new Promise((resolve, reject) => {
  axios.patch(productsUrl, productObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const createProduct = (productObj) => new Promise((resolve, reject) => {
  axios.post(`${productsUrl}`, productObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const deleteProduct = (productObj) => new Promise((resolve, reject) => {
  axios.patch(productsUrl, productObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default {
  getAllProducts,
  getSingleProduct,
  getFilteredProducts,
  getProductsOfAShop,
  updateProduct,
  createProduct,
  deleteProduct,
};
