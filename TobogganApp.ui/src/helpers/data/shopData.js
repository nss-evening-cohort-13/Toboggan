import axios from 'axios';
import { baseUrl } from './config.json';

const shopUrl = `${baseUrl}/Shop`;

const GetAllShops = () => {
    return new Promise((resolve, reject) =>
        axios.get(shopUrl).then(response => resolve(response.data))
    );
}

export default {GetAllShops};
