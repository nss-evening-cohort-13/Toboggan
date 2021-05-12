import React, { Component } from 'react';
import ShopForm from '../../Components/Forms/ShopForm';

export default class CreateShopView extends Component {
  render() {
    return (
      <div>
        <h2>Create Shop</h2>
        <ShopForm userId={this.props.user.uid} />
      </div>
    );
  }
}
