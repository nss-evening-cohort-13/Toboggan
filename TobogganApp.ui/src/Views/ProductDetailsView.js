import React, { Component } from 'react';
import ProductCard from '../Components/Card/ProductCard';

export default class ProductDetailsView extends Component {
    state = {
      singleProduct: this.props.location.state,
      quantity: 0,
    };

    render() {
      const { singleProduct } = this.state;

      return (
          <>
            <h1 className="m-2">{singleProduct.title}</h1>
            <div className="d-flex justify-content-center">
            <img className="singleProductImage m-2" src={singleProduct.productImage} alt="product Image"/>
            <div className="d-flex p-5 productDescription flex-column">
               <p>{singleProduct.description}</p>
               <button className="btn btn-outline-success">Add to cart</button>
            </div>
            </div>
          </>
      );
    }
}
