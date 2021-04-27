import React, { Component } from 'react';
import ProductCard from '../Components/Card/ProductCard';
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
    const renderProducts = () => products.slice(0, 20).map((product) => (<ProductCard key={product.id} productData={product} />));

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
