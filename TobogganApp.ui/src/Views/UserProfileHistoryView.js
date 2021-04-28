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
    Promise.all([orderData.fetchOrdersForAllSales(id)])
      .then((results) => {
        const order = results[0];
        // console.warn(order);
        setOrderInfo(order);
      });
  }, []);

  return (
    <>
    <h2>Your Order History</h2>
    <div className='d-flex User-Profile'>
      <BioCard userData={ userInfo }/>
      <OrderHistoryTable orderData={ orderInfo } />
    </div>
    </>
  );
}
