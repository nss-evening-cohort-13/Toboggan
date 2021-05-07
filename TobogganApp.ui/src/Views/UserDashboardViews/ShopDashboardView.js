import React, { Component } from 'react';
import BioCard from '../../Components/Card/UserBioCard';
import userData from '../../helpers/data/userData';
import orderData from '../../helpers/data/orderData';
import catData from '../../helpers/data/categoryData';
import Dashboard from '../../Components/Card/Dashboard';

export default class Shop extends Component {
  state = {
    userInfo: '',
    totalInfo: '',
    totalByDate: '',
    categoryDate: '',
    toBeShipped: '',
    orderLineItems: [],
    error: '',
    userId: this.props.user?.uid,
  }

  componentDidMount() {
    userData.getSingleUser(this.state.userId)
      .then((response) => {
        this.setState({
          userInfo: response,
        });
      });
    orderData.fetchTotalAllSalesAvgById(this.state.userId)
      .then((response) => {
        this.setState({
          totalInfo: response,
        });
      });
    orderData.fetchTotalSalesByDate(this.state.userId)
      .then((response) => {
        this.setState({
          totalByDate: response,
        });
      });
    catData.GetCategoryData(this.state.userId)
      .then((response) => {
        this.setState({
          categoryData: response,
        });
      });
    orderData.fetchOrdersToBeShipped(this.state.userId)
      .then((response) => {
        this.setState({
          toBeShipped: response,
        });
      });
  }

  getDate() {
    return new Date();
  }

  salesThisMonth = () => this.state.totalByDate.filter((tot) => (this.getDate().getFullYear() === tot.year) && ((this.getDate().getMonth() + 1) == tot.month));

  render() {
    const {
      userInfo,
      totalInfo,
      categoryData,
      toBeShipped,
    } = this.state;
    return (
      <>
      <h2>Shop Dashboard</h2>
      <div className='d-flex User-Profile'>
        <BioCard userData={ userInfo }/>
        <Dashboard totalInfo={ totalInfo } salesThisMonth={this.salesThisMonth} categoryData={categoryData} toBeShipped={toBeShipped} />
      </div>
      </>
    );
  }
}
