import React from 'react';
import CategoryInventory from './CategoryInventoryCard';
import CategorySales from './CategorySalesCard';

export default function Dashboard(props) {
  const { totalInfo, salesThisMonth, categoryData } = props;
  return (
    <>
    <div className='d-flex User-Profile'>
    <div className='flex-column'>
    <h2>Total sales:</h2>
    <div>${ totalInfo && totalInfo.length > 0 ? totalInfo[0].total : ''}</div>
    <h2>Total sales for { salesThisMonth && salesThisMonth.length ? `${salesThisMonth[0].month}/${salesThisMonth[0].year}` : ''}:</h2>
    <div>{ salesThisMonth && salesThisMonth.length ? salesThisMonth[0].total : ''}</div>
    <h2>Average Per Item</h2>
    <div> { totalInfo && totalInfo.length > 0 ? (totalInfo[0].total / totalInfo[0].totQuantity).toFixed(2) : '' } </div>
    <h2> Total Inventory by Category--</h2>
    <div>{categoryData && categoryData.length && categoryData.map((catData) => <CategoryInventory catData={catData}/>)}
    <h2>Total Sales by Category:</h2>
    <div>{categoryData && categoryData.length && categoryData.map((catData) => <CategorySales catData={catData}/>)}</div>
    </div>
    <h2> Orders that require shipping</h2>
    </div>
    </div>
    </>
  );
}
