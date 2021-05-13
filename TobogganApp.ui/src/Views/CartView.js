import React, { Component } from 'react';
import CartData from '../helpers/data/cartData';
import ShoppingCartCard from '../Components/Card/SHoppingCartCard';

export default class CartView extends Component {
  state = {
    products: [],
  };

  componentDidMount() {
    const { products } = this.state;
    this.getCartProducts();
  }

  getCartProducts = () => {
    this.setState({
      products: CartData.getCart(),
    });
  }

  render() {
    const { products } = this.state;
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
      </>
    );
  }
}
