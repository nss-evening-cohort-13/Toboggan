import React, { Component } from 'react';
import OrderHistoryTable from '../../Components/Card/OrderCard';
import orderData from '../../helpers/data/orderData';

export default class PurchaseHistoryView extends Component {
  state = {
    userId: this.props.user?.uid,
    orders: [],
  }

  componentDidMount() {
    orderData.fetchOrdersForAllSales(this.state.userId)
      .then((response) => {
        this.setState({
          orders: response,
        });
        console.warn(response);
      });
  }

  render() {
    const { orders } = this.state;
    return (
      <div className="m-4">
        <h2>Shop Orders</h2>
        <h3>hello</h3>
        <OrderHistoryTable orderData={orders}/>
      </div>
    );
  }
}
