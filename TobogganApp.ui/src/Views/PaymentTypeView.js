import React, { Component } from 'react';
import PaymentCard from '../Components/Card/PaymentCard';
import paymentData from '../helpers/data/paymentTypeData';
import PaymentForm from '../Components/Forms/PaymentForm';
import AppModal from '../Components/AppModal';

export default class PaymentTypeView extends Component {
  state = {
    paymentTypes: [],
    user: this.props.location.state,
  };

  componentDidMount() {
    this.loadThePayments(this.state.user.id);
  }

  loadThePayments = (userId) => {
    paymentData.getUsersPaymentTypes(userId).then((response) => {
      this.setState({
        paymentTypes: response,
      });
    });
  }

  render() {
    const { paymentTypes, user } = this.state;
    const renderPayments = () => paymentTypes.map((payment) => (<PaymentCard key={payment.id} paymentData={payment} onUpdate={this.loadThePayments} />));

    return (
        <>
          <h1 className="m-2">Payments</h1>
          <AppModal
          btnColor={'outline-info'}
          title='Add A Payment'
          buttonLabel={'Add A Payment'}
          className2={'btn btn-md'}
        >
          <PaymentForm userId={user.id} onUpdate={() => this.loadThePayments()}/>
        </AppModal>
          <div className="d-flex flex-wrap justify-content-center">
          {renderPayments()}
          </div>
        </>
    );
  }
}
