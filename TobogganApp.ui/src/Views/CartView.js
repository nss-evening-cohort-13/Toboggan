import React, { Component } from 'react';
import Typography from '@material-ui/core/Typography';
import PaymentSubmitForm from '../Components/Forms/PaymentSubmitForm';
import CartData from '../helpers/data/cartData';
import ShoppingCartCard from '../Components/Card/ShoppingCartCard';
import LocalStorage from '../helpers/localStorage';

export default class CartView extends Component {
  state = {
    products: [],
    totalCost: 0,
    show: false,
    oderDone: false,
  };

  componentDidMount() {
    this.Mounted = true;
    const { products } = this.state;
    this.getCartProducts();
  }

  componentWillUnmount() {
    this.Mounted = false;
  }

  getCartProducts = () => {
    this.setState({
      products: LocalStorage.getItem('cart'),
    });
  }

  orderDoneFlip = () => {
    this.setState({
      orderDone: !this.state.orderDone,
    });
  }

  removeItem = (product) => {
    let tempCart = LocalStorage.getItem('cart');
    tempCart = tempCart.filter((item) => item.id !== product.id);
    LocalStorage.setItem('cart', tempCart);
    this.setState({
      products: LocalStorage.getItem('cart'),
    });
  };

  render() {
    const { products, orderDone } = this.state;

    let grandTotal = 0;
    if (products != null && products.length) {
      grandTotal += products.reduce((totalCost, product) => totalCost + parseInt(product.price * product.quantity, 10), 0);
    }

    let renderProducts;
    if (products && Object.keys(products) !== 0) {
      renderProducts = () => products.map((product) => (
          <ShoppingCartCard key={product.id} productData={product} removeItem={() => this.removeItem(product)}/>
      ));
    }
    const submitButton = () => {
      const { show } = this.state;
      this.setState({ show: !show });
    };

    return (
      <>
      <h1>Your Cart</h1>
      <div className="d-flex flex-column justify-content-center">
        {(products != null) ? renderProducts() : ''}
        {!orderDone
        && <button className="btn btn-danger productButtons" onClick={() => submitButton()}>Proceed to Checkout</button> }
        {this.state.show && <PaymentSubmitForm products={ products } userId={this.props.user.uid} buttonFlip={this.orderDoneFlip}/>}
      </div>
      <div className="d-flex justify-content-center m-2">
        <h2>Your total is ${grandTotal}</h2>
      </div>
      </>
    );
  }
}
