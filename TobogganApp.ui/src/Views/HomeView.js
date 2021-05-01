import React, { Component } from 'react';
import firebase from 'firebase/app';
import 'firebase/auth';
import ProductCard from '../Components/Card/ProductCard';
import productsData from '../helpers/data/productData';
import SearchBar from '../Components/SearchBar';

export default class HomePageView extends Component {
  state = {
    products: [],
    userId: '',
  };

  componentDidMount() {
    firebase.auth().onAuthStateChanged((user) => {
      this.setState({
        userId: user.uid,
      });
    });
    productsData.getAllProducts().then((response) => {
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
        <SearchBar/>
          <h1 className="m-2">Products</h1>
          <div className="d-flex flex-wrap justify-content-center">
          {renderProducts()}
          </div>
        </>
    );
  }
}
