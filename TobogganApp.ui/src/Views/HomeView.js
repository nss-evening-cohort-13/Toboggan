import React, { Component } from 'react';
import ProductCard from '../Components/Card/ProductCard';
import productsData from '../helpers/data/productData';
import SearchBar from '../Components/SearchBar';

export default class HomePageView extends Component {
  state = {
    products: [],
  };

  componentDidMount() {
    productsData.getAllProducts().then((response) => {
      this.setState({
        products: response,
      });
    });
  }

  render() {
    const { products } = this.state;
    const productsActive = products.filter((product) => product.active == 1);
    const renderProducts = () => productsActive.slice(0, 20)
      .map((product) => (<ProductCard key={product.id} productData={product} />));

    return (
        <>
          <div className="d-flex justify-content-between"><h1 className="m-2 home-title">Products</h1><span className="homeSearch"><SearchBar/></span></div>
          <div className="d-flex flex-wrap justify-content-center home-products">
          {renderProducts()}
          </div>
        </>
    );
  }
}
