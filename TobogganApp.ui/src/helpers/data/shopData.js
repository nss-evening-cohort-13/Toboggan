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
    resolve(response.data);
  }).catch((error) => reject(error));
});

// const checkIfUserHasShop = (userId, source) => new Promise((resolve, reject) => {
//   axios.get(`${shopUrl}/getByUserId/${userId}`, { cancelToken: source.token }).then((response) => {
//     resolve(response.data);
//   }).catch((error) => {
//     if (axios.isCancel(error));
//   });
// });

const getSingleShopByUserId = (userId) => new Promise((resolve, reject) => {
  axios.get(`${shopUrl}/getByUserId/${userId}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const createShop = (shopData) => new Promise((resolve, reject) => {
  axios.post(`${shopUrl}`, shopData).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const updateShop = (shopData) => new Promise((resolve, reject) => {
  axios.patch(shopUrl, shopData).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const deleteShop = (shopId) => new Promise((resolve, reject) => {
  axios.delete(`${shopUrl}/${shopId}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default {
  getAllShops,
  getSingleShop,
  createShop,
  updateShop,
  deleteShop,
  getSingleShopByUserId,
};
