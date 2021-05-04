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
    this.getSellers();
    this.showResults();
  }

  getSellers = () => {
    userData.getSellerData().then((response) => {
      console.warn('user resp', response);
      this.setState({
        sellers: response,
      });
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
        console.warn('product resp', response);
        this.setState({
          productResults: response,
          searchInput,
        });
      });

    userData
      .getFilteredSellers(searchInput.toLowerCase())
      .then((response) => {
        console.warn('seller in show results resp', response);
        this.setState({
          sellerResults: response,
        });
      });
  };

  showSellerResults = () => {
    const searchInput = this.props.match.params.term;
    console.warn('search input', searchInput);

    const { sellers } = this.state;

    console.warn('sellers state', sellers);
    const sellerResults = [];

    const firstNameFilter = sellers.filter((seller) => seller.firstName.toLowerCase().includes(searchInput.toLowerCase()));
    // const lastNameFilter = sellers.filter((seller) => seller.lastName.toLowerCase().includes(searchInput.toLowerCase()));

    sellerResults.push(firstNameFilter);
    // sellerResults.push(lastNameFilter);

    this.setState({
      sellerResults: firstNameFilter,
    }, this.setLoading);

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
          {renderSellers()}
        </div>
        {/* {loading ? (
          <h1>Loading</h1>
        ) : (
          <div>
            {renderSellers()}
          </div>
        )} */}
      </>
    );
  }
}
