import React, { Component } from 'react';
import { Link, Route, withRouter } from 'react-router-dom';
import shopData from '../helpers/data/shopData';
import productData from '../helpers/data/productData';
import ProductCard from '../Components/Card/ProductCard';
import FavoriteData from '../helpers/data/favoriteShopData';

class SingleShopView extends Component {
  state = {
    shopId: this.props.location.state || this.props.shopId,
    shopsProducts: [],
    shop: null,
    authed: this.props.authed || false,
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

  deleteShop = (shopId) => {
    FavoriteData.deleteFavoritesOfASpecificShop(shopId).then(() => {
      shopData.deleteShop(shopId).then(() => {
        this.props.history.push('/user-dashboard/my-shop');
      });
    });
  }

  render() {
    const {
      shopsProducts,
      shop,
      shopId,
      authed,
    } = this.state;

    return (
      <>
        {shop !== null && (
        <div className="d-flex justify-content-center m-2">
          <div className='d-flex flex-column m-4 shopDetailsSection'>
            <h1 className="shopTitle m-3">{shop.name}</h1>
            <img src={shop.shopImage} alt='shop' className="singleShopImg" />
            <p className="shopDescription m-3">{shop.description}</p>
            {authed
            && <>
            <Link
            to={{
              pathname: '/shopForm',
              state: shop,
            }}>
            <button className="btn btn-primary">Edit Shop</button>
            </Link>
            <button className="btn btn-danger" onClick={() => this.deleteShop(shopId)}>Delete Shop</button>
             <Link
             to={{
               pathname: '/productsForm',
               state: shop.id,
             }}>
             <button className="btn btn-primary">Add Product</button>
             </Link>
             </>
            }

          </div>
          <div className='d-flex flex-wrap justify-content-center'>
              {shopsProducts.map((product) => <ProductCard key={product.id} authed={authed} productData={product}/>)}
          </div>
        </div>
        )}
      </>
    );
  }
}

export default withRouter(SingleShopView);
