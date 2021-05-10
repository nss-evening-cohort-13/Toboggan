// import React, { Component } from 'react';
// import Box from '@material-ui/core/Box';
// import { Link } from 'react-router-dom';

// export default class UserDashboardView extends Component {
//   render() {
//     return (
//       <div>
//         <Box
//           display='flex'
//           flexDirection='column'
//           p={1}
//           m={1}
//           bgcolor='background.paper'>
//           <Link
//             to={{
//               pathname: 'user-dashboard/account-info',
//             }}>
//             <button className='btn btn-dark my-2'>Account Info</button>
//           </Link>
//           <Link
//             to={{
//               pathname: 'user-dashboard/purchase-history',
//             }}>
//             <button className='btn btn-dark my-2'>Purchase History</button>
//           </Link>
//           <Link
//             to={{
//               pathname: 'user-dashboard/my-shop',
//             }}>
//             <button className='btn btn-dark my-2'>My Shop</button>
//           </Link>
//           <Link
//             to={{
//               pathname: 'user-dashboard/shop-dashboard',
//             }}>
//             <button className='btn btn-dark my-2'>Shop Dashboard</button>
//           </Link>
//           <Link
//             to={{
//               pathname: 'user-dashboard/shop-orders',
//             }}>
//             <button className='btn btn-dark my-2'>Shop Orders</button>
//           </Link>
//         </Box>
//       </div>
//     );
//   }
// }

import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import UserDashboardCard from '../../Components/Card/UserDashboardCard';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    margin: 20,
  },
  paper: {
    padding: theme.spacing(2),
    textAlign: 'center',
    color: theme.palette.text.secondary,
  },
}));

export default function UserDashboardView() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container spacing={5}>
        <Grid item xs={3}>
          <UserDashboardCard title="Account Info" pathname="user-dashboard/account-info"/>
        </Grid>
        <Grid item xs={3}>
          <UserDashboardCard title="Purchase History" pathname="user-dashboard/purchase-history"/>
        </Grid>

        {/* If user doesn't have shop */}
        <Grid item xs={3}>
          <UserDashboardCard title="Create Shop" pathname="user-dashboard/create-shop"/>
        </Grid>

        {/* If user has shop */}
        <Grid item xs={3}>
          <UserDashboardCard title="My Shop" pathname="user-dashboard/my-shop"/>
        </Grid>
        <Grid item xs={3}>
          <UserDashboardCard title="Shop Dashboard" pathname="user-dashboard/shop-dashboard"/>
        </Grid>
        <Grid item xs={3}>
          <UserDashboardCard title="Shop Orders" pathname="user-dashboard/shop-orders"/>
        </Grid>
      </Grid>
    </div>
  );
}
