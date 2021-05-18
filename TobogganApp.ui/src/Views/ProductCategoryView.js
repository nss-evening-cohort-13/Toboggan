import React, { Component } from 'react';
import categoryData from '../helpers/data/categoryData';
import ProductCard from '../Components/Card/ProductCard';

export default class ProductCategoryView extends Component {
  state = {
    categories: [],
  };

  componentDidMount() {
    categoryData
      .GetCategoryProducts()
      .then((response) => this.setState({ categories: response }));
  }

  render() {
    const { categories } = this.state;

    const renderProducts = (category) => category.products.slice(0, 3).map((product) => (<ProductCard key={product.id} productData={product} />));

    const renderCategories = () => categories.map((category) => (
    <div key={category.name}>
      <h3 key={category.name}>{category.name} - {category.quantity}</h3>
      {/* Show last 3 created products from each category */}
      <div key={category.categoryId} className="d-flex flex-wrap justify-content-center">
        {renderProducts(category)}
      </div>
    </div>
    ));

    return (
      <>
          {renderCategories()}
      </>
    );
  }
}
