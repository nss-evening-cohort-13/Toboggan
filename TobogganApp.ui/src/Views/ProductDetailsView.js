import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import QuantityAlert from '../Components/Alerts/QuantityAlert';
import AddedToCartAlert from '../Components/Alerts/AddedToCartAlert';
import NoQuantitySelected from '../Components/Alerts/NoQuantitySelectedAlert';
import cartData from '../helpers/data/cartData';

export default class ProductDetailsView extends Component {
  state = {
    singleProduct: this.props.location.state,
    quantity: 0,
    addedToCart: false,
    clicked: false,
  };

  handleChange = (e) => {
    e.preventDefault();
    this.setState({
      [e.target.name]: e.target.value,
    });
  };

  addToCart = (e) => {
    this.setState({
      clicked: true,
    });
    const { singleProduct, quantity } = this.state;
    e.preventDefault();
    const productObject = {
      id: singleProduct.id,
      title: singleProduct.title,
      productImage: singleProduct.productImage,
      decription: singleProduct.description,
      shopId: singleProduct.shopId,
      price: singleProduct.price,
      quantity,
    };
    if (quantity >= 1) {
      cartData.setCart(productObject);
      this.setState({
        addedToCart: true,
      });
      setTimeout(() => {
        this.setState({
          addedToCart: false,
        });
      }, 3500);
    }
  };

  render() {
    const {
      singleProduct,
      quantity,
      addedToCart,
      clicked,
    } = this.state;

    return (
      <>
        <h1 className='mb-4 mt-2 productTitle'>{singleProduct.title}</h1>
        <div className='d-flex justify-content-center singleProductContainer'>
          <img
            className='singleProductImage m-2'
            src={singleProduct.productImage}
            alt='product'
          />
          <div className='d-flex p-5 productDescriptionSection flex-column justify-content-center'>
            <p className='singleProductDescription'>{singleProduct.description}</p>
            <h6 className='productPrice'>${singleProduct.price}</h6>
            {quantity > singleProduct.quantity && (
              <QuantityAlert productData={singleProduct} />
            )}
             {clicked && quantity === 0 && (
              <NoQuantitySelected productData={singleProduct} />
             )}
            {addedToCart && <AddedToCartAlert productData={singleProduct} />}
            <input
              type='number'
              name='quantity'
              value={this.state.name}
              onChange={this.handleChange}
              placeholder='Enter a Quantity'
              className='form-control mb-2 mr-2 inputText'
              required
            />
            <button
              onClick={this.addToCart}
              className='btn m-1 btnPrimary'
            >
              Add To Cart
            </button>
            <Link
              to={{
                pathname: '/singleShopPage',
                state: singleProduct.shopId,
              }}
            >
              <button className='btn m-1 btnSecondary'>
                View Shop's Page
              </button>
            </Link>
          </div>
        </div>
      </>
    );
  }
}
