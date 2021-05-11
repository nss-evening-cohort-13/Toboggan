import React, { Component } from 'react';
import OrderHistoryTable from '../../Components/Card/OrderCard';
// import orderData from '../../helpers/data/orderData';
import userData from '../../helpers/data/userData';

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
    return (
      <div className="m-4">
        <h2>Purchase History</h2>
      </div>
    );
  }
}
