import React, { Component } from 'react';
import ProductCard from '../Components/Card/ProductCard';
import productData from '../helpers/data/productData';
import SearchBar from '../Components/SearchBar';
import userData from '../helpers/data/userData';
import UserCard from '../Components/Card/SellerCard';

export default class SearchProductResults extends Component {
  state = {
    loading: true,
    results: [],
    sellers: [],
    searchInput: '',
  };

  componentWillMount() {
    this.showResults();
    this.getSellers();
  }

  getSellers = () => {
    userData.getSellerData().then((response) => {
      console.warn('seller data resp', response);
      this.setState({
        sellers: response,
      }, this.setLoading);
    });
  }

  // showSellers = () => {
  //   const { sellers } = this.state;
  //   const sellersArray = sellers.map((user) => userData.getSingleUser(user.UserId).then((resp) => {
  //     sellers.push(resp);
  //   }));
  //   this.setState({
  //     sellers: sellersArray,
  //   });
  //   console.warn('update state', sellers);
  //   return sellersArray;
  // }

  setLoading = () => {
    this.timer = setInterval(() => {
      this.setState({ loading: false });
    }, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.timer);
  }

  showResults = () => {
    const searchInput = this.props.match.params.term;

    productData
      .getFilteredProducts(searchInput.toLowerCase())
      .then((response) => {
        this.setState({
          results: response,
          searchInput,
        });
      });
  };

  componentDidUpdate(prevState) {
    if (prevState.match.params.term !== this.props.match.params.term) {
      this.showResults();
    }
  }

  render() {
    const { results, loading, sellers } = this.state;
    const renderSellers = () => sellers.map((seller) => <UserCard key={seller.id} userData={seller} />);
    const showResults = () => results.map((product) => (
        <ProductCard key={product.id} productData={product} />
    ));

    return (
      <>
        <SearchBar />
        <div className='d-flex flex-wrap justify-content-center'>
          {showResults()}
        </div>
        {loading ? (
          <h1>Loading</h1>
        ) : (
          <div>
            {renderSellers()}
          </div>
        )}
      </>
    );
  }
}
