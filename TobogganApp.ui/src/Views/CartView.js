import React, { Component } from 'react';
import CartData from '../helpers/data/cartData';
import ShoppingCartCard from '../Components/Card/ShoppingCartCard';

export default class CartView extends Component {
  state = {
    products: [],
    totalCost: 0,
  };

  componentDidMount() {
    const { products } = this.state;
    this.getCartProducts();
    if (products.length) {
      const total = products.reduce((totalCost, qP) => totalCost + parseInt(qP.price * qP.quantity, 10), 0);
    }
  }

  getCartProducts = () => {
    this.setState({
      products: CartData.getCart(),
    });
  }

  render() {
    const { products } = this.state;

    let grandTotal = 0;
    if (products.length) {
      grandTotal += products.reduce((totalCost, qP) => totalCost + parseInt(qP.price * qP.quantity, 10), 0);
    }

    let renderProducts;
    if (products && Object.keys(products) !== 0) {
      renderProducts = () => products.map((product) => (
          <ShoppingCartCard productData={product}/>

      ));
    }
    return (
      <>
      <h1>Your Cart</h1>
      <div className="d-flex flex-column justify-content-center">
        {renderProducts()}
      </div>
      <h2>Your Total is : ${grandTotal}</h2>
      </>
    );
  }
}
