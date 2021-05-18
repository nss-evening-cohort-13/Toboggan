import React, { Component } from 'react';
import 'firebase/storage';
import shopData from '../../helpers/data/shopData';
import productData from '../../helpers/data/productData';
import categoryData from '../../helpers/data/categoryData';

export default class ProductsForm extends Component {
    state = {
      id: this.props.location.state?.id || '',
      title: this.props.location.state?.title || '',
      description: this.props.location.state?.description || '',
      price: this.props.location.state?.price || '',
      quantity: this.props.location.state?.quantity || '',
      shopId: this.props.location.state?.shop || '',
      CategoryId: this.props.location.state?.categoryId || '',
      productImage: this.props.location.state?.productImage,
      userId: this.props.location.state?.userId || this.props?.userId,
      allCategories: [],
    }

    async componentDidMount() {
      await this.setState({ userId: this.props.user?.uid });
      categoryData.GetAllCategories().then((categories) => {
        this.setState({ allCategories: categories });
      });
      await shopData.getSingleShopByUserId(this.state.userId)
        .then((shopId) => {
          this.setState({ shopId: shopId.id });
        });
    }

    handleChange = (e) => {
      this.setState({
        [e.target.name]: e.target.value,
      });
    };

    handleSubmit = (e) => {
      e.preventDefault();
      const CategoryId = Number(this.state.CategoryId);
      const priceNum = Number(this.state.price);
      const quantityNum = Number(this.state.quantity);
      const shopIdNum = Number(this.state.shopId);
      if (this.state.id === '') {
        const productObject = {
          Title: this.state.title,
          Description: this.state.description,
          Price: priceNum,
          Quantity: quantityNum,
          ShopId: shopIdNum,
          CategoryId,
          ProductImage: this.state.productImage,
        };
        productData.createProduct(productObject).then(() => {
          this.setState({ success: true });
          setTimeout(() => {
            this.props.history.push('/user-dashboard/my-shop');
          }, 3000);
        });
      } else {
        const productObjectUpdate = {
          Id: this.state.id,
          Title: this.state.title,
          Description: this.state.description,
          Price: priceNum,
          Quantity: quantityNum,
          ShopId: shopIdNum,
          CategoryId,
          ProductImage: this.state.productImage,
        };
        productData.updateProduct(productObjectUpdate).then(() => {
          this.setState({ success: true });
          setTimeout(() => {
            this.props.history.push('/user-dashboard/my-shop');
          }, 3000);
        });
      }
    };

    render() {
      const { success } = this.state;
      return (
            <div className="shopForm mr-auto ml-auto mt-5">
        {success && (
          <div className='alert alert-success' role='alert'>
            Your Product was Updated/Created
          </div>
        )}
        <form onSubmit={this.handleSubmit}>
        {this.state.title}
          <div>
            <input
              type='text'
              name='title'
              value={this.state.title}
              onChange={this.handleChange}
              placeholder='Product Name'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='description'
              value={this.state.description}
              onChange={this.handleChange}
              placeholder='Product Description'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='price'
              value={this.state.price}
              onChange={this.handleChange}
              placeholder='Product Price'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='quantity'
              value={this.state.quantity}
              onChange={this.handleChange}
              placeholder='Enter a Quanity'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
            <input
              type='text'
              name='productImage'
              value={this.state.productImage}
              onChange={this.handleChange}
              placeholder='Enter an Image URL'
              className='form-control form-control-lg m-2'
              required
            />
          </div>
          <div>
              <select name='CategoryId' onChange={this.handleChange} >
              {this.state.allCategories.map((category) => (<option value={category.id}>{category.name}</option>))}
              </select>
          </div>
          <button
            ref={(btn) => {
              this.btn = btn;
            }}
            className='btn btn-primary m-2'
          >
            Submit
          </button>
        </form>
      </div>
      );
    }
}
