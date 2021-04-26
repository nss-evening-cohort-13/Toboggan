import React, { useState, useEffect } from 'react';
import BioCard from '../Components/Card/UserBioCard';
import OrderHistoryTable from '../Components/Card/OrderCard';
import fetchUserData from '../helpers/data/userData';
import orderData from '../helpers/data/orderData';

export default function UserProfileView(props) {
  const [userInfo, setUserInfo] = useState([]);
  const [orderInfo, setOrderInfo] = useState([]);
  const [orderLineItems, setOrderLineItems] = useState();
  const [error, updateError] = useState([]);
  const { id } = props.match.params;

  useEffect(() => {
    fetchUserData(id)
      .then((data) => {
        setUserInfo(data);
      });
    orderData.fetchOrdersForAllSales(id)
      .then((results) => {
        const order = results[0];
        setOrderInfo(order);
      });
  }, []);

  /*  const inCurrentMonth = (date) => {
    if(date) {
      const dateArr = date.split('-');
      console.warn(dateArr);
      const month = date[1];
      const year = date[0];
      const currentdate = new Date();
      const curMonth = currentdate.getMonth() + 1;
      const curYear = currentdate.getFullYear();

    if (curMonth == month && year == curYear) {
      return true;
    }
    return false;
    }
  };
  console.warn([orderInfo]);
  // const ordersThisMonth = [orderInfo].filter((o) => inCurrentMonth(o.saleDate));
  // console.warn(ordersThisMonth);
*/
  return (
    <>
    <h2>User Profile Dashboard</h2>
    <div className='d-flex User-Profile'>
      <BioCard userData={ userInfo }/>
      Total sales:
Total sales this month:
Average per item:
Total Inventory by Category:
Gardening: 100
Sports: 200
Clothes: 300
Orders that require shipping:
quantity
    </div>
    </>
  );
}
