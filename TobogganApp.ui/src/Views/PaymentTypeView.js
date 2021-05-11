import React, { Component } from 'react';
import PaymentCard from '../Components/Card/PaymentCard';
import paymentData from '../helpers/data/paymentTypeData';

export default class PaymentTypeView extends Component {
  state = {
    paymentTypes: [],
  };

  componentDidMount() {
    paymentData.getUsersPaymentTypes(this.props.location.user.id).then((response) => {
      this.setState({
        paymentTypes: response,
      });
    });
  }

  render() {
    const { paymentTypes } = this.state;
    const renderPayments = () => paymentTypes.map((payment) => (<PaymentCard key={payment.id} paymentData={payment} />));

    return (
        <>
        <SearchBar/>
          <h1 className="m-2">Payments</h1>
          <div className="d-flex flex-wrap justify-content-center">
          {renderPayments()}
          </div>
        </>
    );
  }
}