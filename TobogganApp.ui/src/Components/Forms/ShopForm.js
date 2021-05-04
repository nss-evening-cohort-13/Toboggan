import React, { Component } from 'react';
import firebase from 'firebase/app';
import 'firebase/storage';
import getUser from '../../helpers/data/authData';
import shopData from '../../helpers/data/shopData';

export default class ShopForm extends Component {
  state = {
    id: this.props.shop?.id || '',
    name: this.props.shop?.name || '',
    shopImage: this.props.shop?.imageUrl || '',
    userId: this.props.shop?.userId || '',
    description: this.props.shop?.description || '',
  };

  componentDidMount() {
    this.setState({ userId: this.props.user.uid });
  }

  handleChange = (e) => {
    this.setState({
      [e.target.name]: e.target.value,
    });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    if (this.state.id === '') {
      const shopObject = {
        Name: this.state.name,
        ShopImage: this.state.shopImage,
        UserId: this.state.userId,
        Description: this.state.description,
      };
      shopData.createShop(shopObject).then(() => {
        this.props.onUpdate?.();
        this.setState({ success: true });
      });
    } else {
      shopData.updateShop(this.state).then(() => {
        this.props.onUpdate?.(this.props.shop.id);
        this.setState({ success: true });
      });
    }
  };

  render() {
    const { success } = this.state;
    return (
      <>
        {success && (
          <div className='alert alert-success' role='alert'>
            Your Shop was Updated/Created
          </div>
        )}
        <form onSubmit={this.handleSubmit}>
          <div>
            <input
              type='text'
              name='name'
              value={this.state.name}
              onChange={this.handleChange}
              placeholder='Shop Name'
              className='form-control form-control-lg m-1'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='description'
              value={this.state.description}
              onChange={this.handleChange}
              placeholder='Shop Description'
              className='form-control form-control-lg m-1'
              required
            />
          </div>
          <div>
            <input
              type='url'
              name='shopImage'
              value={this.state.shopImage}
              onChange={this.handleChange}
              placeholder='Enter an Image URL'
              className='form-control form-control-lg m-1'
              required
            />
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
      </>
    );
  }
}
