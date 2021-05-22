import React, { Component } from 'react';
import paymentData from '../../helpers/data/paymentTypeData';

class PaymentForm extends Component {
  state = {
    id: this.props.paymentData?.id || '',
    accountNumber: this.props.paymentData?.accountNumber || '',
    typeName: this.props.paymentData?.typeName || 0,
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
      paymentData.createPayment(paymentObject).then(() => {
        this.setState({ success: true });
        setTimeout(() => {
          this.props.onUpdate?.(this.state.userId);
          if (this.props.modal !== false) {
            this.props.toggle();
          }
        }, 1800);
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
        setTimeout(() => {
          this.props.onUpdate?.(this.state.userId);
          if (this.props.modal !== false) {
            this.props.toggle();
          }
        }, 1800);
      });
    }
  };

  render() {
    const { success } = this.state;
    return (
      <div className="shopForm mr-auto ml-auto mt-5">
        {success && (
          <div className='alert alertSuccess' role='alert'>
            Your Payment was Updated/Created
          </div>
        )}
        <div>
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
            required
            >
            <option value={0}>MasterCard</option>
            <option value={1}>Visa</option>
            <option value={2}>Paypal</option>
            <option value={3}>Discover</option>
          </select>
          </div>
          <button
            onClick={this.handleSubmit}
            className='btn btnSecondary m-2'
          >
            Submit
          </button>
        </div>
      </div>
    );
  }
}

export default PaymentForm;
