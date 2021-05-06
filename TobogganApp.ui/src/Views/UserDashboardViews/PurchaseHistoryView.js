import React, { Component } from 'react';
import PurchaseHistoryTable from '../../Components/Card/PurchaseHistoryCard';
import userData from '../../helpers/data/userData';

export default class PurchaseHistoryView extends Component {
  state = {
    purchaseHistory: [],
    userId: this.props.user?.uid,
  };

  componentDidMount() {
    userData.getPurchaseHistory(this.state.userId).then((response) => {
      this.setState({
        purchaseHistory: response,
      });
    });
  }

  render() {
    const { purchaseHistory } = this.state;
    return (
      <div>
        <h2>Purchase History</h2>
        <PurchaseHistoryTable orderData={purchaseHistory} />
      </div>
    );
  }
}
