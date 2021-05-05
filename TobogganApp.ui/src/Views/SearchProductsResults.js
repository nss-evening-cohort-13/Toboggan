import React, { Component } from 'react';
import ProductCard from '../Components/Card/ProductCard';
import productData from '../helpers/data/productData';
import SearchBar from '../Components/SearchBar';
import userData from '../helpers/data/userData';
import UserCard from '../Components/Card/SellerCard';

export default class SearchProductResults extends Component {
  state = {
    productResults: [],
    sellerResults: [],
    searchInput: '',
  };

  componentWillMount() {
    this.showResults();
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

    userData
      .getFilteredSellers(searchInput.toLowerCase())
      .then((response) => {
        this.setState({
          sellerResults: response,
        });
      });
  };

  componentDidUpdate(prevState) {
    if (prevState.match.params.term !== this.props.match.params.term) {
      this.showResults();
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
        {productResults.length ? (
          <div className='product-results-container'>
            <h1>Products</h1>
            <div className='d-flex flex-wrap justify-content-center'>
              {showResults()}
            </div>
          </div>
        ) : ''
        }
        {sellerResults.length ? (
          <div className='seller-results-container'>
            <h1>Sellers</h1>
            <div className='d-flex flex-wrap justify-content-center'>
              {renderSellers()}
            </div>
          </div>
        ) : ''
        }
      </>
    );
  }
}
