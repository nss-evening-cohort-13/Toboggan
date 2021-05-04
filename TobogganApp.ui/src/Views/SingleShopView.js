import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import shopData from '../helpers/data/shopData';
import productData from '../helpers/data/productData';
import ProductCard from '../Components/Card/ProductCard';

export default class SingleShopView extends Component {
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
        <div className="d-flex justify-content-center m-2">
          <div className='d-flex flex-column m-4 shopDetailsSection'>
            <h1 className="shopTitle m-3">{shop.title}</h1>
            <img src={shop.shopImage} alt='shop' className="singleShopImg" />
            <p className="shopDescription m-3">{shop.description}</p>
            <Link
            to={{
              pathname: '/shopForm',
              state: shop,
            }}>
            <button className="btn btn-primary">Edit Shop</button>
            </Link>
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
