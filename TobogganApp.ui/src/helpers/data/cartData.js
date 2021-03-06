import localStorage from '../localStorage';

let cart = [];

const loadCart = () => {
  if (localStorage.getItem('cart')) {
    cart = localStorage.getItem('cart');
  } else {
    cart = [];
  }
};

const setCart = (addedItem) => {
  loadCart();
  const addedItemQuantity = parseInt(addedItem.quantity, 10);
  const productIndex = cart.findIndex((product) => product.id === addedItem.id);

  if (productIndex !== -1) {
    const previousQuantity = parseInt(cart[productIndex].quantity, 10);
    cart[productIndex].quantity = addedItemQuantity + previousQuantity;
  } else {
    cart.push(addedItem);
  }
  localStorage.setItem('cart', cart);
};

const getCart = () => cart;

const emptyCart = () => {
  cart.length = 0;

  localStorage.removeItem('cart');
};

export default {
  loadCart,
  setCart,
  getCart,
  emptyCart,
};
