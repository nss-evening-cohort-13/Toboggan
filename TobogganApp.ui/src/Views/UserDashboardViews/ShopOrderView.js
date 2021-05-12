import React, { Component } from 'react';
import ShopOrderTable from '../../Components/Card/ShopOrderCard';
import userData from '../../helpers/data/userData';

export default class ShopOrderView extends Component {
  state = {
    shopOrder: [],
    userId: this.props.user?.uid,
  };

  componentDidMount() {
    userData.getShopOrderHistory(this.state.userId).then((response) => {
      this.setState({
        shopOrder: response,
      });
    });
  }

  render() {
    const { shopOrder } = this.state;
    return (
      <div className="m-4">
        {shopOrder.length
          ? <>
             <h1>Shop Order History</h1>
             <ShopOrderTable orderData={shopOrder} />
            </> : <h2>No Purchases yet. Head to the shops!</h2>
        }

      </div>
    );
  }
}
