import React, { Component } from 'react';
import ProductCard from '../Components/Products/ProductCard';

export default class HomePageView extends Component {
    state = {
      singleProduct: this.props.location.state,
    };

    render() {
      const { singleProduct } = this.state;

      return (
          <>
            <h1 className="m-2">Products</h1>
            <div className="d-flex flex-wrap justify-content-center">
            {<ProductCard productData={singleProduct} />}
            </div>
          </>
      );
    }
}
