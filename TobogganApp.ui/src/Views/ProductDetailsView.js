import React, { Component } from 'react';
import ProductCard from '../Components/Products/ProductCard';

export default class ProductDetailsView extends Component {
    state = {
      singleProduct: this.props.location.state,
    };

    render() {
      const { singleProduct } = this.state;

      return (
          <>
            <h1 className="m-2">{singleProduct.title}</h1>
            <div className="d-flex flex-wrap justify-content-center">
            {<ProductCard productData={singleProduct} />}
            </div>
          </>
      );
    }
}
