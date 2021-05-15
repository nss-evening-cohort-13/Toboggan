import React from 'react';
import CategoryInventory from './CategoryInventoryCard';
import CategorySales from './CategorySalesCard';
import OrdersToBeShipped from './ToBeShippedCard';

export default function Dashboard(props) {
  const {
    totalInfo, salesThisMonth, categoryData, toBeShipped,
  } = props;
  return (
    <div className='d-flex flex-wrap justify-content-center'>
    <div className="dash-container m-2 p-2">
      <h2>Total sales</h2>
      <h5>${ totalInfo && totalInfo.length > 0 ? totalInfo[0].total : ''}</h5>
    </div>
    <div className="dash-container m-2 p-2">
      <h2>Total sales for { salesThisMonth && salesThisMonth.length ? `${salesThisMonth[0].month}/${salesThisMonth[0].year}` : ''}:</h2>
      <h5>{ salesThisMonth && salesThisMonth.length ? salesThisMonth[0].total : ''}</h5>
    </div>
    <div className="dash-container m-2 p-2">
      <h2>Average Per Item</h2>
      <h5> { totalInfo && totalInfo.length > 0 ? (totalInfo[0].total / totalInfo[0].totQuantity).toFixed(2) : '' }
      </h5>
    </div>
    <div className="dash-container m-2 p-2">
      <h2> Total Inventory by Category</h2>
        <h5>{categoryData && categoryData.length && categoryData.map((catData) => <CategoryInventory catData={catData} key={catData.id}/>)}
        </h5>
      <h2>Total Sales by Category:</h2>
        <h5>{categoryData && categoryData.length && categoryData.map((catData) => <CategorySales catData={catData} key={catData.id}/>)}
        </h5>
    </div>
    <div className="dash-container m-2 p-2">
      <h2> Orders that require shipping</h2>
      { toBeShipped && (<OrdersToBeShipped orderData={toBeShipped} />) }
    </div>
    </div>
  );
}
