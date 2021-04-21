import axios from 'axios';
import { baseUrl } from './config.json';

const productsUrl = `${baseUrl}/Products`;

const getAllProducts = () => new Promise((resolve, reject) => {
    axios
      .get(productsUrl)
      .then((response) => {
        resolve(response.data);
      })
      .catch((error) => reject(error));
  });

export { getAllProducts };
