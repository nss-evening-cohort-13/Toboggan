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
      <p key={category.id}>{category.name} - {category.quantity}</p>
      {/* Show last 3 created products from each category */}
    </>
    ));

    return (
      <>
        <h3>
          {renderCategories()}
        </h3>
      </>
    );
  }
}
