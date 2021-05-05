import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import ShopForm from '../../Components/Forms/ShopForm';
import SingleShopView from '../SingleShopView';

class MyShopView extends Component {
  state = {
    userHasAShop: false,
    userId: '',
    myShop: null,
  }

  componentDidMount() {
    this.setState({ userId: this.props.user?.uid });
  }

  render() {
    const { userHasAShop, userId, mySh } = this.state;
    return (
      <div>
        {!userHasAShop
        && <ShopForm location={this.props.location} userId={userId}/>}
        {}
        <h2>My Shop</h2>
      </div>
    );
  }
}

export default withRouter(MyShopView);
