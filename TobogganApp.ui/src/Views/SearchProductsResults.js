import React, { Component } from 'react';
import ProductCard from '../Components/Card/ProductCard';
import productData from '../helpers/data/productData';
import SearchBar from '../Components/SearchBar';
import userData from '../helpers/data/userData';
import UserCard from '../Components/Card/SellerCard';

export default class SearchProductResults extends Component {
  state = {
    loading: true,
    productResults: [],
    sellerResults: [],
    sellers: [],
    searchInput: '',
  };

  componentWillMount() {
    this.showResults();
    this.getSellers();
  }

  getSellers = () => {
    userData.getSellerData().then((response) => {
      this.setState({
        sellers: response,
      }, this.setLoading);
    });
  }

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
          productResults: response,
          searchInput,
        });
      });
  };

  showSellerResults = () => {
    const searchInput = this.props.match.params.term;
    const { sellers } = this.state;
    const sellerResults = [];

    const firstNameFilter = sellers.filter((seller) => seller.firstName.toLowerCase().includes(searchInput.toLowerCase()));
    const lastNameFilter = sellers.filter((seller) => seller.lastName.toLowerCase().includes(searchInput.toLowerCase()));

    sellerResults.push(firstNameFilter);
    sellerResults.push(lastNameFilter);

    // this.setState({
    //   sellerResults,
    // });

    console.warn('seller state', sellerResults);
  }

  componentDidUpdate(prevState) {
    if (prevState.match.params.term !== this.props.match.params.term) {
      this.showResults();
      this.showSellerResults();
    }
  }

  render() {
    const { productResults, loading, sellerResults } = this.state;
    const renderSellers = () => sellerResults.map((seller) => <UserCard key={seller.id} userData={seller} />);
    const showResults = () => productResults.map((product) => (
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
            {this.showSellerResults()}
          </div>
        )}
      </>
    );
  }
}
