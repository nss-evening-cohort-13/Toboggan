import axios from 'axios';
import { baseUrl } from './config.json';

const paymentUrl = `${baseUrl}/PaymentType`;

const getUsersPaymentTypes = (user) => new Promise((resolve, reject) => {
  axios.get(`${paymentUrl}/getbyUserId/${userId}`).then((response) => {
    resolve(response.data);
  })
    .catch((error) => reject(error));
});

const createPaymentType = (paymentObj) => new Promise((resolve, reject) => {
  axios.post(`${paymentUrl}`, paymentObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const updatePayment = (paymentObj) => new Promise((resolve, reject) => {
  axios.patch(paymentUrl, paymentObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const deletePayment = (paymentId) => new Promise((resolve, reject) => {
  axios.delete(`${paymentUrl}/${paymentId}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default {
  getUsersPaymentTypes,
  createPaymentType,
  updatePayment,
  deletePayment,
};
