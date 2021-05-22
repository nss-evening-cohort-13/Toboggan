import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import 'firebase/storage';
import shopData from '../../helpers/data/shopData';

class ShopForm extends Component {
  state = {
    id: this.props.location.state?.id || '',
    name: this.props.location.state?.name || '',
    shopImage: this.props.location.state?.shopImage || '',
    userId: this.props.location.state?.userId || this.props?.userId,
    description: this.props.location.state?.description || '',
  };

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
        this.setState({ success: true });
        setTimeout(() => {
          this.props.history.push('/user-dashboard/my-shop');
        }, 3000);
      });
    } else {
      shopData.updateShop(this.state).then(() => {
        this.setState({ success: true });
        setTimeout(() => {
          this.props.history.push('/user-dashboard/my-shop');
        }, 3000);
      });
    }
  };

  render() {
    const { success } = this.state;
    return (
      <div className="shopForm mr-auto ml-auto mt-5">
        {success && (
          <div className='alert alertSuccess' role='alert'>
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
              placeholder='Shop Description'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='shopImage'
              value={this.state.shopImage}
              onChange={this.handleChange}
              placeholder='Enter an Image URL'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <button
            ref={(btn) => {
              this.btn = btn;
            }}
            className='btn btnTertiary m-2'
          >
            Submit
          </button>
        </form>
      </div>
    );
  }
}

export default withRouter(ShopForm);
