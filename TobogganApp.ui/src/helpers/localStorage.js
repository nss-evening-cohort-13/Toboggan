const getItem = (key) => JSON.parse(window.localStorage.getItem(key));
const setItem = (key, value) => window.localStorage.setItem(key, JSON.stringify(value));

const removeItem = (key) => window.localStorage.removeItem(key);
const clearAllItems = () => window.localStorage.clear();

export default {
  getItem,
  setItem,
  removeItem,
  clearAllItems,
};
