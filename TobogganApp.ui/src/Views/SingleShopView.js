import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import shopData from '../helpers/data/shopData';
import productData from '../helpers/data/productData';
import ProductCard from '../Components/Card/ProductCard';

export default class SIngleShopView extends Component {
  state = {
    shopId: this.props.location.state,
    shopsProducts: [],
    shop: null,
  };

  componentDidMount() {
    shopData.getSingleShop(this.state.shopId).then((response) => {
      this.setState({
        shop: response,
      });
    });
    productData.getProductsOfAShop(this.state.shopId).then((response) => {
      this.setState({
        shopsProducts: response,
      });
    });
  }

  render() {
    const { shopsProducts, shop } = this.state;

    return (
      <>
        {shop !== null && (
        <div className="d-flex justify-content-center">
          <div className='d-flex flex-column'>
            <h1>{shop[1]}</h1>
            <img src={shop[4]} alt='shop' />
          </div>
          <div className='d-flex flex-wrap justify-content-center'>
              {shopsProducts.map((product) => <ProductCard key={product.id} productData={product}/>)}
          </div>
        </div>
        )}
      </>
    );
  }
}
