import React, { Component } from 'react';
import Box from '@material-ui/core/Box';
import { Link } from 'react-router-dom';

export default class UserDashboardView extends Component {
  render() {
    return (
      <div>
        <Box
          display='flex'
          flexDirection='column'
          p={1}
          m={1}
          bgcolor='background.paper'>
          <Link
            to={{
              pathname: 'user-dashboard/account-info',
            }}>
            <button className='btn btn-dark my-2'>Account Info</button>
          </Link>
          <Link
            to={{
              pathname: 'user-dashboard/purchase-history',
            }}>
            <button className='btn btn-dark my-2'>Purchase History</button>
          </Link>
          <Link
            to={{
              pathname: 'user-dashboard/my-shop',
            }}>
            <button className='btn btn-dark my-2'>My Shop</button>
          </Link>
          <Link
            to={{
              pathname: 'user-dashboard/shop-dashboard',
            }}>
            <button className='btn btn-dark my-2'>Shop Dashboard</button>
          </Link>
          <Link
            to={{
              pathname: 'user-dashboard/shop-orders',
            }}>
            <button className='btn btn-dark my-2'>Shop Orders</button>
          </Link>
        </Box>
      </div>
    );
  }
}
