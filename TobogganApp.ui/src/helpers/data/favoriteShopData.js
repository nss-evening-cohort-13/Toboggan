import axios from 'axios';
import { baseUrl } from './config.json';

const favoriteUrl = `${baseUrl}/FavoriteShop`;

const deleteFavoritesOfASpecificShop = (shopId) => new Promise((resolve, reject) => {
  axios.delete(`${favoriteUrl}/byShopId/${shopId}`).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default { deleteFavoritesOfASpecificShop };
