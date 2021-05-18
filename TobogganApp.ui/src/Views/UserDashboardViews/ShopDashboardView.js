import React, { useState, useEffect } from 'react';
import userData from '../../helpers/data/userData';
import orderData from '../../helpers/data/orderData';
import catData from '../../helpers/data/categoryData';
import Dashboard from '../../Components/Card/Dashboard';

export default function ShopDashboardView(props) {
  const [userInfo, setUserInfo] = useState([]);
  const [myid, setId] = useState([]);
  const [totalInfo, setTotalInfo] = useState([]);
  const [totalByDate, SetTotalByDate] = useState([]);
  const [categoryData, setCategoryData] = useState([]);
  const [toBeShipped, setToBeShipped] = useState([]);
  const [orderLineItems, setOrderLineItems] = useState();
  const [error, updateError] = useState([]);
  const id = props.user?.uid;

  useEffect(() => {
    userData.getSingleUser(id)
      .then((data) => {
        setUserInfo(data);
        setId(id);
      });
    orderData.fetchTotalAllSalesAvgById(id)
      .then((results) => {
        const totals = results;
        setTotalInfo(totals);
      });
    orderData.fetchTotalSalesByDate(id)
      .then((results) => {
        const total = results;
        SetTotalByDate(total);
      });
    catData.GetCategoryData(id)
      .then((results) => {
        const total = results;
        setCategoryData(total);
      });
    orderData.fetchOrdersToBeShipped(id)
      .then((results) => {
        const things = results;
        setToBeShipped(things);
      });
  }, []);

  function getDate() {
    return new Date();
  }

  const salesThisMonth = totalByDate.filter((tot) => (getDate().getFullYear() === tot.year) && ((getDate().getMonth() + 1) == tot.month));
  const totalSalesMonth = salesThisMonth.reduce((sum, order) => (sum + order.total), 0);

  return (
    <>
    <h2>Your Order History</h2>
    <div className='d-flex User-Profile'>
      <Dashboard totalInfo={ totalInfo } salesThisMonth={totalSalesMonth}
                 categoryData={categoryData} toBeShipped={toBeShipped} />
    </div>
    </>
  );
}
