import LocalStorage from '../localStorage';

let cart = [];

const loadCart = () => {
  if (LocalStorage.getItem('cart')) {
    cart = LocalStorage.getItem('cart');
  } else {
    cart = [];
  }
};

const setCart = (item) => {
  cart.push(item);
  LocalStorage.setItem('cart', cart);
};

const getCart = () => cart;

const emptyCart = () => {
  cart.length = 0;

  LocalStorage.removeItem('cart');
};

export default {
  loadCart,
  setCart,
  getCart,
  emptyCart,
};
