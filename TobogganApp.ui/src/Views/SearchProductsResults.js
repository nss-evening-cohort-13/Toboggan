import React, { Component } from 'react';
import ProductCard from '../Components/Card/ProductCard';
import productData from '../helpers/data/productData';
import SearchBar from '../Components/SearchBar';

export default class SearchProductResults extends Component {
  state = {
    results: [],
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
    const { results } = this.state;

    const showResults = () => results.map((product) => (
        <ProductCard key={product.id} productData={product} />
    ));
    return (
      <>
        <SearchBar />
        <div className='d-flex flex-wrap justify-content-center'>
          {showResults()}
        </div>
      </>
    );
  }
}
