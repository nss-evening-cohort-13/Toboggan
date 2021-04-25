import React, { Component } from 'react';
import categoryData from '../helpers/data/categoryData';

export default class ProductCategoryView extends Component {
  state = {
    categories: [],
  };

  componentDidMount() {
    categoryData
      .GetQuantityOfProductsPerCategory()
      .then((response) => this.setState({ categories: response }));
  }

  render() {
    const { categories } = this.state;
    const renderCategories = () => categories.map((category) => (
    <>
      <h3 key={category.id}>{category.name} - {category.quantity}</h3>
      {/* Show last 3 created products from each category */}
      <p>product here</p>
    </>
    ));

    return (
      <>
          {renderCategories()}
      </>
    );
  }
}
