import axios from 'axios';
import { baseUrl } from "./config.json";

const getAllProducts = () => new Promise((resolve, reject) => {
    axios.get(baseUrl).then((response) => {
      resolve(response.data);
    }).catch((error) => reject(error));
  });


  export {
    getAllProducts
  };