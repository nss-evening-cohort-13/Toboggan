import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import ShopForm from '../../Components/Forms/ShopForm';
import SingleShopView from '../SingleShopView';
import shopData from '../../helpers/data/shopData';

class MyShopView extends Component {
  state = {
    userHasAShop: false,
    userId: this.props.user?.uid,
    myShop: null,
  }

  componentDidMount() {
    shopData.getSingleShopByUserId(this.state.userId).then((response) => {
      this.setState({
        myShop: response,
        userHasAShop: true,
      });
      console.warn(response);
    });
  }

  render() {
    const { userHasAShop, userId, myShop } = this.state;
    return (
      <div>
        {!userHasAShop
        && <ShopForm location={this.props.location} userId={userId}/>}
        {myShop !== null
        && <div>
            <h2>My Shop</h2>
            <SingleShopView shopId={myShop.id} authed={true}/>
          </div>
        }
      </div>
    );
  }
}

export default withRouter(MyShopView);
