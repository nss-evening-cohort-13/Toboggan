import React, { Component } from 'react';
import ProductCard from '../Components/Products/ProductCard';
import { getAllProducts } from '../helpers/data/productData';

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
    const renderProducts = () =>
      products.map((product) => (
        <ProductCard key={product.id} productData={product} />
      ));
      
  }
}
