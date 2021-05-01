import React, { useState, useEffect } from 'react';
import BioCard from '../Components/Card/UserBioCard';
import userData from '../helpers/data/userData';
import orderData from '../helpers/data/orderData';
import catData from '../helpers/data/categoryData';
import Dashboard from '../Components/Card/Dashboard';

export default function UserProfileView(props) {
  const [userInfo, setUserInfo] = useState([]);
  const [totalInfo, setTotalInfo] = useState([]);
  const [totalByDate, SetTotalByDate] = useState([]);
  const [categoryData, setCategoryData] = useState([]);
  const [toBeShipped, setToBeShipped] = useState([]);
  const [orderLineItems, setOrderLineItems] = useState();
  const [error, updateError] = useState([]);
  const { id } = props.match.params;

  useEffect(() => {
    userData.fetchUserData(id)
      .then((data) => {
        setUserInfo(data);
      });
    orderData.fetchTotalAllSalesAvgById(id)
      .then((results) => {
        const totals = results;
        setTotalInfo(totals);
      });
    orderData.fetchtotalSalesByDate(id)
      .then((results) => {
        const total = [...results];
        SetTotalByDate(total);
      });
    catData.GetCategoryData(id)
      .then((results) => {
        const total = [...results];
        setCategoryData(total);
      });
    orderData.fetchOrdersToBeShipped(id)
      .then((results) => {
        const things = [...results];
        setToBeShipped(things);
      });
  }, []);

  function getDate() {
    return new Date();
  }

  const salesThisMonth = totalByDate.filter((tot) => (getDate().getFullYear() === tot.year) && ((getDate().getMonth() + 1) == tot.month));

  // const monthOverMonth = saleshThisMonth()[0].total;
  return (
    <>
    <h2>Your Order History</h2>
    <div className='d-flex User-Profile'>
      <BioCard userData={ userInfo }/>
      <Dashboard totalInfo={ totalInfo } salesThisMonth={salesThisMonth}
                 categoryData={categoryData} toBeShipped={toBeShipped} />
    </div>
    </>
  );
}
