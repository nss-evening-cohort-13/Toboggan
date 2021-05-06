import React, { Component } from 'react';
import firebase from 'firebase/app';
import 'firebase/storage';
import getUser from '../../helpers/data/authData';
import shopData from '../../helpers/data/shopData';
import productData from '../../helpers/data/productData';
import categoryData from '../../helpers/data/categoryData';

export default class ProductsForm extends Component {
    state = {
      id: this.props.location.state?.id || '',
      title: this.props.location.state?.title || '',
      description: this.props.location?.description || '',
      price: this.props.location?.price || '',
      quantity: this.props.location?.quantity || '',
      shopId: this.props.location?.shopId || '',
      categoryId: this.props.location?.categoryId || '',
      productImage: this.props.location?.productImage,
      allCategories: [],
    }

    componentDidMount() {
      this.setState({ userId: this.props.user?.uid });
      categoryData.GetAllCategories().then((categories) => {
        this.setState({ allCategories: categories });
      });
      console.warn(this.state.userId);
    }

    handleChange = (e) => {
      this.setState({
        [e.target.name]: e.target.value,
      });
    };

    handleSubmit = (e) => {
      e.preventDefault();
      if (this.state.id === '') {
        const productObject = {
          Title: this.state.title,
          Description: this.state.description,
          Price: this.state.price,
          Quantity: this.state.quantity,
          ShopId: this.state.shopId,
          CategoryId: this.state.CategoryId,
          ProductImage: this.state.productImage,
        };
        productData.createProduct(productObject).then(() => {
          this.setState({ success: true });
        });
      } else {
        productData.updateProduct(this.state).then(() => {
          this.setState({ success: true });
        });
      }
    };

    render() {
      const { success } = this.state;

      return (
            <div className="shopForm mr-auto ml-auto mt-5">
        {success && (
          <div className='alert alert-success' role='alert'>
            Your Product was Updated/Created
          </div>
        )}
        <form onSubmit={this.handleSubmit}>
          <div>
            <input
              type='text'
              name='title'
              value={this.state.title}
              onChange={this.handleChange}
              placeholder='Product Name'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='description'
              value={this.state.description}
              onChange={this.handleChange}
              placeholder='Product Description'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='price'
              value={this.state.price}
              onChange={this.handleChange}
              placeholder='Product Price'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='shopId'
              value={this.state.productImage}
              onChange={this.handleChange}
              placeholder='Enter an Image URL'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
              <select name='category' value={this.state.type} onChange={this.handleChange} >
              {this.state.allCategories.map((category) => (<option value={category.id}>{category.name}</option>))}
              </select>
          </div>
          <button
            ref={(btn) => {
              this.btn = btn;
            }}
            className='btn btn-primary m-2'
          >
            Submit
          </button>
        </form>
      </div>
      );
    }
}
