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
      <div className="m-4">
        {purchaseHistory.length
          ? <>
             <h1>Purchase History</h1>
             <PurchaseHistoryTable orderData={purchaseHistory} />
            </> : <h2>No Purchases yet. Head to the shops!</h2>
        }

      </div>
    );
  }
}
