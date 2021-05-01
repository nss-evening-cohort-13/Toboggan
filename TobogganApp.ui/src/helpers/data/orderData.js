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
    console.warn(response);
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
  axios.get(`${orderDataUrl}/SellerTotalandAvgPrice/${id}`, {
    params: { userId: id },
  }).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const fetchtotalSalesByDate = (id) => new Promise((resolve, reject) => {
  axios.get(`${orderDataUrl}/totalSalesByDate/${id}`, {
    params: { userId: id },
  }).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default {
  fetchOrderData,
  fetchOrdersWithLineItemData,
  fetchOrdersForAllSales,
  fetchTotalAllSalesAvgById,
  fetchtotalSalesByDate,
};
