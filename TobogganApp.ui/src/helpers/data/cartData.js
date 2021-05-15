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

// const removeItems = (e) => {
//   const itemTitle = e.target.closest('tr').id;
//   const filteredItems = cart.filter((item) => item.title !== itemTitle);
//   cart = filteredItems;

//   LocalStorage.setItem('cart', cart);
// };

const removeItem = (product) => {
  LocalStorage.removeItem(product.id);
};

export default {
  loadCart,
  setCart,
  getCart,
  emptyCart,
  removeItem,
};
