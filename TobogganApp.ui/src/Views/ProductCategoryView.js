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
    console.warn('categories', categories);

    const categoryCard = (category) => {
      <div>{category.Name}</div>;
    };

    const cards = categories.map(categoryCard);
    console.warn('cards', cards);

    return (
      <div>
        <>
          <h2>Categories</h2>
          {cards}
        </>
      </div>
    );
  }
}
