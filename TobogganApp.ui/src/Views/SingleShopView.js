import React, { Component } from 'react';
import { Link } from 'react-router-dom';

export default class ProductDetailsView extends Component {
  state = {
    idOfUser: this.props.location.state,
    shopsProducts: [],
    shop: [],
  };

  componentDidMount(){
    //Get data for the products of the shop
    //Get data for the shop
  }

  render() {
    const { shopsProducts } = this.state;

    return (
      <>
        <h1 className='mb-4 mt-2'>{singleProduct.title}</h1>
        <div className='d-flex justify-content-center'>
          <img
            className='singleProductImage m-2'
            src={singleProduct.productImage}
            alt='product Image'
          />
          <div className='d-flex p-5 productDescription flex-column'>
            <p>{singleProduct.description}</p>
            <h6>${singleProduct.price}</h6>
            {quantity > singleProduct.quantity && (
              <QuantityAlert productData={singleProduct} />
            )}
            {addedToCart && <AddedToCartAlert productData={singleProduct} />}
            <input
              type='text'
              name='quantity'
              value={this.state.name}
              onChange={this.handleChange}
              placeholder='Enter a Quantity'
              className='form-control form-control mb-2 mr-2'
              required
            />
            <button
              onClick={this.handleSubmit}
              className='btn btn-outline-success m-1'
            >
              Add to cart
            </button>
            <Link
              to={{
                pathname: 'shopPage',
              }}
            >
              <button className='btn btn-outline-primary m-1'>
                View Shop's Page
              </button>
            </Link>
          </div>
        </div>
      </>
    );
  }
}
