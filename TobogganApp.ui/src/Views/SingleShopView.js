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
      const productsActive = response.filter((product) => product.active == 1);
      this.setState({
        shopsProducts: productsActive,
      });
    });
  }

  deleteProd = (productId) => {
    async function Myfetch() {
      const prod = productData.getSingleProduct(productId);
      return prod;
    }
    Myfetch().then((prod) => {
      const productObjectUpdate = {
        Id: prod.id,
        Title: prod.title,
        Description: prod.description,
        Price: prod.price,
        Quantity: prod.quantity,
        ShopId: prod.shopId,
        CategoryId: prod.categoryId,
        ProductImage: prod.productImage,
        Active: 0,
      };
      productData.updateProduct(productObjectUpdate).then(() => {
        this.setState({ success: true });
        const productsActive = this.state.shopsProducts.filter((x) => x.id !== prod.id);
        this.setState({
          shopsProducts: productsActive,
        });
        setTimeout(() => {
          this.props.history.push('/user-dashboard/my-shop');
        }, 3000);
      });
    });
  };

  deleteShop = (shopId) => {
    FavoriteData.deleteFavoritesOfASpecificShop(shopId).then(() => {
      shopData.deleteShop(shopId).then(() => {
        this.props.history.push('/user-dashboard/my-shop');
      });
    });
  };

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
        <div className="d-flex justify-content-center m-5">
          <div className='d-flex flex-column m-1 shopDetailsSection'>
            <img src={shop.shopImage} alt='shop' className="singleShopImg" />
            <h1 className="shopTitle m-3">{shop.name}</h1>
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
              {shopsProducts && shopsProducts.map((product) => <ProductCard key={product.id} authed={authed} deleteProd={this.deleteProd} productData={product}/>)}
          </div>
        </div>
        )}
      </>
    );
  }
}

export default withRouter(SingleShopView);
