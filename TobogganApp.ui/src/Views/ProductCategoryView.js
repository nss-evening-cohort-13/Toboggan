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
    return (
      <>
        <h3>
          {categories.map((category) => (
            <p key={category.id}>{category.name} - {category.quantity}</p>
          ))}
        </h3>
      </>
    );
  }
}
