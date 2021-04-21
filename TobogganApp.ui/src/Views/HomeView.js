import React, { Component } from 'react';
import ProductCard from '../Components/Products/ProductCard';
import getAllProducts from '../helpers/data/productData';

export default class HomePageView extends Component {
  state = {
    products: [],
  };

  componentDidMount() {
    getAllProducts().then((response) => {
      this.setState({
        products: response,
      });
    });
  }

  render() {
    const { products } = this.state;
    const renderProducts = () => products.map((product) => (<ProductCard key={product.Id} productData={product} />));

    return (
        <>
          <h1 className="m-2">Products</h1>
          <div className="d-flex flex-wrap justify-content-center">
          {renderProducts()}
          </div>
          </>
    );
  }
}
