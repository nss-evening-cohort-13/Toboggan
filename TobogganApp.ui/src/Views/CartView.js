import React, { Component } from 'react';
import Typography from '@material-ui/core/Typography';
import PaymentSubmitForm from '../Components/Forms/PaymentSubmitForm';
import CartData from '../helpers/data/cartData';
import ShoppingCartCard from '../Components/Card/ShoppingCartCard';

export default class CartView extends Component {
  state = {
    products: [],
    show: false,
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
      products: CartData.getCart(),
    });
  }

  render() {
    const { products, showPayMentBox } = this.state;
    let renderProducts;
    if (products && Object.keys(products) !== 0) {
      renderProducts = () => products.map((product) => (
          <ShoppingCartCard productData={product}/>

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
        {renderProducts()}
        <Typography variant="body2" color="textSecondary" component="p">
        <button className="btn btn-danger productButtons" onClick={() => submitButton()}>Submit Order</button>
        </Typography>
        {this.state.show && <PaymentSubmitForm userId={this.props.user.uid} />}
      </div>
      </>
    );
  }
}
