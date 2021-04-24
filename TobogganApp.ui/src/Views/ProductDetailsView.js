import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import QuantityAlert from '../Components/Alerts/QuantityAlert';

export default class ProductDetailsView extends Component {
    state = {
      singleProduct: this.props.location.state,
      quantity: 0,
    };

    handleChange = (e) => {
      e.preventDefault();
      this.setState({
        [e.target.name]: e.target.value,
      });
    };

    render() {
      const { singleProduct, quantity } = this.state;

      return (
          <>
            <h1 className="mb-4 mt-2">{singleProduct.title}</h1>
            <div className="d-flex justify-content-center">
            <img className="singleProductImage m-2" src={singleProduct.productImage} alt="product Image"/>
            <div className="d-flex p-5 productDescription flex-column">
               <p>{singleProduct.description}</p>
               {quantity > singleProduct.quantity && <QuantityAlert productData={singleProduct}/>}
               <input
                      type='text'
                      name='quantity'
                      value={this.state.name}
                      onChange={this.handleChange}
                      placeholder='Enter a Quantity'
                      className='form-control form-control mb-2 mr-2'
                      required
                    />
               <button className="btn btn-outline-success m-1">Add to cart</button>
               <Link to={{
                 pathname: 'sellerPage',
               }}>
               <button className="btn btn-outline-primary m-1">View Seller's Page</button>
               </Link>
            </div>
            </div>
          </>
      );
    }
}
