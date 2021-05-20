import axios from 'axios';
import { baseUrl } from './config.json';

const orderDataUrl = `${baseUrl}/Orders`;

const fetchOrderData = (id) => new Promise((resolve, reject) => {
  axios.get(`${orderDataUrl}/User/${id}`, {
    params: { userId: id },
  }).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const fetchOrdersWithLineItemData = (id) => new Promise((resolve, reject) => {
  axios.get(`${orderDataUrl}/orderLineItems/${id}`, {
    params: { userId: id },
  }).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const fetchOrdersForAllSales = (id) => new Promise((resolve, reject) => {
  axios.get(`${orderDataUrl}/SellerOrder/${id}`, {
    params: { userId: id },
  }).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const fetchTotalAllSalesAvgById = (id) => new Promise((resolve, reject) => {
  axios.get(`${orderDataUrl}/SellerTotalandAvgPrice/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const fetchTotalSalesByDate = (id) => new Promise((resolve, reject) => {
  axios.get(`${orderDataUrl}/totalSalesByDate/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const fetchOrdersToBeShipped = (id) => new Promise((resolve, reject) => {
  axios.get(`${orderDataUrl}/SellerOrderToBeShipped/${id}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const createOrder = (productObj) => new Promise((resolve, reject) => {
  axios.post(orderDataUrl, productObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default {
  fetchOrderData,
  fetchOrdersWithLineItemData,
  fetchOrdersForAllSales,
  fetchTotalAllSalesAvgById,
  fetchTotalSalesByDate,
  fetchOrdersToBeShipped,
  createOrder,
};
