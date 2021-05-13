import React, { Component } from 'react';
import paymentData from '../../helpers/data/paymentTypeData';

class PaymentForm extends Component {
  state = {
    id: this.props.paymentData?.id || '',
    accountNumber: this.props.paymentData?.accountNumber || '',
    typeName: this.props.paymentData?.typeName || '',
    userId: this.props.paymentData?.userId || this.props?.userId,
  };

  handleChange = (e) => {
    this.setState({
      [e.target.name]: e.target.value,
    });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    if (this.state.id === '') {
      const paymentObject = {
        AccountNumber: parseInt(this.state.accountNumber, 10),
        TypeName: parseInt(this.state.typeName, 10),
        UserId: this.state.userId,
      };
      paymentData.createPayment(paymentObject).then((response) => {
        console.warn(response);
        this.setState({ success: true, id: response.id });
        this.props.onUpdate?.(this.state.userId);
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
    }
    const date = new Date();
    const myOrder = {
      UserId: this.props.userId,
      TotalCost: 100,
      PaymentTypeId: this.state.id,
      SaleDate: date,
      Completed: 0,
    };
    console.warn(myOrder);
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
