import React, { Component } from 'react';
import categoryData from '../helpers/data/categoryData';

export default class ProductCategoryView extends Component {
  state = {
    categories: [],
  };

  componentDidMount() {
    categoryData
      .GetAllCategories()
      .then((response) => this.setState({ categories: response }));
  }

  render() {
    const { categories } = this.state;
    return (
      <>
        <h2>Categories</h2>
        <div>
          {
          categories.map((category) => (
            <p key={category.id}>{category.name}</p>
          ))
          }
        </div>
      </>
    );
  }
}
