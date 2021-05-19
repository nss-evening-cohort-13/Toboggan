import React, { Component } from 'react';
import userData from '../../helpers/data/userData';
import PurchaseHistoryCard from '../../Components/Card/PurchaseHistoryCard';

export default class PurchaseHistoryView extends Component {
  state = {
    userId: this.props.user?.uid,
    orders: [],
  }

  componentDidMount() {
    this.getPurchaseOrderHistory();
  }

  getPurchaseOrderHistory = () => {
    const { userId } = this.state;

    userData.getPurchaseHistory(userId)
      .then((response) => {
        this.setState({
          orders: response,
        });
      });
  }

  render() {
    const { orders } = this.state;
    const renderOrders = orders.map((order) => <PurchaseHistoryCard key={order.ProductId} orderData={order} />);
    return (
      <div className="m-4">
        <h2>Purchase History</h2>
        {orders.length ? renderOrders : <h4>You have not made any purchases yet. Click on one of the tabs to start browsing!</h4>}
      </div>
    );
  }
}
