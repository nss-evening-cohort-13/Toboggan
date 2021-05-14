import React, { Component } from 'react';
import paymentData from '../../helpers/data/paymentTypeData';
import OrderData from '../../helpers/data/orderData';
import OrderLineItems from '../../helpers/data/orderLineItemData';
import cartStorage from '../../helpers/data/cartData';

class PaymentForm extends Component {
  state = {
    id: this.props.paymentData?.id || '',
    accountNumber: this.props.paymentData?.accountNumber || '',
    typeName: this.props.paymentData?.typeName || '',
    userId: this.props.paymentData?.userId || this.props?.userId,
    grandTotal: 0,
  };

createOrderWithLineItems = (order) => {
  OrderData.createOrder(order).then((orderId) => {
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
    OrderLineItems.createLineItem(cartItem);
  });
}

MakeOrder = (grandTotal, paymentId) => {
  const date = new Date();
  const myOrder = {
    UserId: this.props.userId,
    TotalCost: grandTotal,
    PaymentTypeId: paymentId,
    SaleDate: date.toJSON(),
    Completed: false,
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
    this.setState({ grandTotal });
    if (this.state.id === '') {
      const paymentObject = {
        AccountNumber: parseInt(this.state.accountNumber, 10),
        TypeName: parseInt(this.state.typeName, 10),
        UserId: this.state.userId,
      };
      paymentData.createPayment(paymentObject).then((response) => {
        this.setState({ success: true });
        this.setState({ id: response.id });
        this.props.onUpdate?.(this.state.userId);
        this.MakeOrder(grandTotal, response.id);
        this.clearCart();
      });
    } else {
      const updatePaymentObject = {
        Id: this.state.id,
        AccountNumber: parseInt(this.state.accountNumber, 10),
        TypeName: parseInt(this.state.typeName, 10),
        UserId: this.state.userId,
      };
      paymentData.updatePayment(updatePaymentObject).then(() => {
        this.setState({ success: true });
        this.props.onUpdate?.(this.state.userId);
      });
      this.MakeOrder(grandTotal, this.state.id);
      this.clearCart();
    }
  };

  render() {
    const { success } = this.state;
    return (
      <div className="shopForm mr-auto ml-auto mt-5">
        {success && (
          <div className='alert alert-success' role='alert'>
            Your Order Was Submitted
          </div>
        )}
        <form onSubmit={this.handleSubmit}>
          <div>
            <input
              type='text'
              name='accountNumber'
              value={this.state.accountNumber}
              onChange={this.handleChange}
              placeholder='Account Number'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
          <select
            as='select'
            name='typeName'
            className='form-control form-control-lg m-1'
            value={this.state.typeName}
            onChange={this.handleChange}
            defaultValue={this.state?.typeName}
            required
            >
            <option>Pick Payment Type</option>
            <option value={0}>MasterCard</option>
            <option value={1}>Visa</option>
            <option value={2}>Paypal</option>
            <option value={3}>Discover</option>
          </select>
          </div>
          <button
            ref={(btn) => {
              this.btn = btn;
            }}
            className='btn btn-primary m-2'
          >
            Submit
          </button>
        </form>
      </div>
    );
  }
}

export default PaymentForm;
