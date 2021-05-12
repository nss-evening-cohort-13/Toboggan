import React, { Component } from 'react';
import CartData from '../helpers/data/cartData';

export default class CartView extends Component {
  state = {
    products: [],
  };

  componentDidMount() {
    this.getCartProducts();
  }

  getCartProducts = () => {
    // console.warn(cart);
    this.setState({
      products: CartData.getCart(),
    });
  }

  render() {
    const { products } = this.state;

    let renderProducts;
    if (products && Object.keys(products) !== 0) {
      renderProducts = () => products.map((product) => (
        <h2>{product}</h2>
        // <h2 key={product.id}>{product.price}</h2>
      ));
    }
    return (
      <div>
        CartView
        {renderProducts()}
      </div>
    );
  }
}
