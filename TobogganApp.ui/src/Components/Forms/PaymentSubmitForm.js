import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import paymentData from '../../helpers/data/paymentTypeData';
import orderData from '../../helpers/data/orderData';
import orderLineItems from '../../helpers/data/orderLineItemData';
import cartStorage from '../../helpers/data/cartData';
import AppModal from '../AppModal';
import PaymentForm from './PaymentForm';

class PaymentSubmitForm extends Component {
  state = {
    userId: this.props.paymentData?.userId || this.props?.userId,
    preExistingPayment: '',
    grandTotal: 0,
    paymentTypes: [],
  };

  componentDidMount() {
    this.loadThePayments(this.state.userId);
  }

loadThePayments = (userId) => {
  paymentData.getUsersPaymentTypes(userId).then((response) => {
    this.setState({
      paymentTypes: response,
    });
  });
}

createOrderWithLineItems = (order) => {
  orderData.createOrder(order).then((orderId) => {
    this.createLineItems(orderId);
  });
}

createLineItems = (order) => {
  const cart = cartStorage.getCart();
  cart.forEach((item) => {
    let cartItem = {};
    cartItem = {
      ProductId: item.id,
      Quantity: parseInt(item.quantity, 10),
      OrderId: order.id,
    };
    orderLineItems.createLineItem(cartItem);
  });
}

MakeOrder = (grandTotal, paymentId) => {
  const date = new Date();
  const myOrder = {
    UserId: this.state.userId,
    TotalCost: grandTotal,
    PaymentTypeId: parseInt(paymentId, 10),
    SaleDate: date.toJSON(),
    Completed: true,
  };
  this.createOrderWithLineItems(myOrder);
}

clearCart = () => cartStorage.emptyCart();

  handleChange = (e) => {
    this.setState({
      [e.target.name]: e.target.value,
    });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    let grandTotal = 0;
    if (this.props.products.length) {
      grandTotal += this.props.products.reduce((totalCost, product) => totalCost + parseInt(product.price * product.quantity, 10), 0);
    }
    this.MakeOrder(grandTotal, this.state.preExistingPayment);
    this.setState({
      success: true,
      grandTotal,
    });
    this.props.buttonFlip();
    setTimeout(() => {
      this.clearCart();
    }, 2000);
  };

  conditionalType(type) {
    switch (type) {
      case 0:
        return 'MasterCard  ';
      case 1:
        return 'Visa  ';
      case 2:
        return 'Paypal  ';
      case 3:
        return 'Discover  ';
      default:
        return '';
    }
  }

  render() {
    const { success, paymentTypes, userId } = this.state;
    return (
      <>
        {success && (
          <>
          <div className='alert alertSuccess' role='alert'>
            Your Order Was Submitted
          </div>
          <div className='dflex'>
          <Link
             to={{
               pathname: '/',
             }}>
             <button className="btn btn-primary w-100 m-2">Back To Home Page</button>
             </Link>
             <Link
             to={{
               pathname: '/user-dashboard/purchase-history',
             }}>
             <button className="btn btn-primary w-100 m-2">Go To Purchase History</button>
             </Link>
          </div>
          </>
        )}
      {!success && (
        <>
        <form onSubmit={this.handleSubmit}>
          <div className='d-flex flex-column justify-content-center align-items-center m-auto'>
          <select
            as='select'
            name='preExistingPayment'
            className='form-control form-control-lg m-2 existingPaymentSelect'
            value={this.state.preExistingPayment}
            onChange={this.handleChange}
            required
            >
            <option>Choose an existing payment</option>
            {paymentTypes.map((payment) => <option key={payment.id} value={payment.id}>{
            this.conditionalType(payment.typeName)}{payment.accountNumber}</option>)}
          </select>
        <AppModal
          btnColor={'outline-info'}
          title='Add A Payment'
          buttonLabel={'Add A Payment'}
          className2={'btn btnTertiary w-100 mr-2 mb-4'}
        >
          <PaymentForm userId={userId} onUpdate={this.loadThePayments}/>
        </AppModal>
        </div>
      {success && (
          <div className='alert alert-success' role='alert'>
            Your Order Was Submitted
          </div>
      )}
          <button
            ref={(btn) => {
              this.btn = btn;
            }}
            className='btn btn-primary w-50 m-auto ml-2 submitButton'
          >
            Submit
          </button>
        </form>
      </>)}
      </>
    );
  }
}

export default PaymentSubmitForm;
