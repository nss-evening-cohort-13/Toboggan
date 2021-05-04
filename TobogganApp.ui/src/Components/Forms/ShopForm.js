import React, { Component } from 'react';
import firebase from 'firebase/app';
import 'firebase/storage';
import getUser from '../../helpers/data/authData';
import { createShop, updateShop } from '../../helpers/data/shopData';

export default class ShopForm extends Component {
  state = {
    name: this.props.shop?.name || '',
    shopImage: this.props.shop?.imageUrl || '',
    userId: this.props.shop?.userId || '',
    description: this.props.shop?.description || '',
  };

  componentDidMount() {
    const userId = getUser();
    this.setState({ userId });
  }

  handleChange = (e) => {
    this.setState({
      [e.target.name]: e.target.value,
    });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    this.btn.setAttribute('disabled', 'disabled');
    if (this.state.firebaseKey === '') {
      createBoard(this.state).then(() => {
        this.props.onUpdate?.();
        this.setState({ success: true });
      });
    } else {
      updateBoard(this.state).then(() => {
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
          <label>Shop Name</label>
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
          <label>Shop Description</label>
          <div>
            <input
              type='text'
              name='description'
              value={this.state.description}
              onChange={this.handleChange}
              placeholder='Board Description'
              className='form-control form-control-lg m-1'
              required
            />
          </div>
          <label>Add an Image</label>
          <div>
            <input
              type='url'
              name='imageUrl'
              value={this.state.imageUrl}
              onChange={this.handleChange}
              placeholder='Enter an Image URL or Upload a File'
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
