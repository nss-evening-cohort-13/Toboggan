import axios from 'axios';
import { baseUrl } from './config.json';

const orderLineItemDataUrl = `${baseUrl}/OrderLineItem`;
const fetchOrderLineData = (orderId) => new Promise((resolve, reject) => {
  axios.get(`${orderLineItemDataUrl}/${orderId}`, {
    params: { orderId },
  }).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default fetchOrderLineData;
