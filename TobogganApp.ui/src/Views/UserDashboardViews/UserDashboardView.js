import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import UserDashboardCard from '../../Components/Card/UserDashboardCard';
import shopData from '../../helpers/data/shopData';

const useStyles = makeStyles({
  root: {
    flexGrow: 1,
    margin: 20,
  },
});

export default function UserDashboardView(props) {
  // console.warn('user', props.user);
  const [userHasAShop, setUserHasAShop] = useState([false]);
  const [userId, setUserId] = useState([props.user?.uid]);
  const classes = useStyles();

  useEffect(() => {
    // const source = axios.CancelToken.source();
    shopData.getSingleShopByUserId(userId)
      .then((response) => {
        setUserId(userId);
        console.warn('response', response);
        if (response) {
          setUserHasAShop(true);
        }
      });
    // return () => source.cancel();
  });

  return (
    <div className={classes.root}>
      <Grid className='d-flex justify-content-center' container spacing={5}>
        <Grid item>
          <UserDashboardCard title="Account Info" pathname="user-dashboard/account-info"/>
        </Grid>
        <Grid item>
          <UserDashboardCard title="Purchase History" pathname="user-dashboard/purchase-history"/>
        </Grid>
        {/* If user doesn't have shop */}
        {!userHasAShop
        && <Grid item >
            <UserDashboardCard title="Create Shop" pathname="user-dashboard/create-shop"/>
          </Grid>}

        {/* If user does have shop */}
        {userHasAShop
        && <>
          <Grid item >
            <UserDashboardCard title="My Shop" pathname="user-dashboard/my-shop"/>
          </Grid>
          <Grid item >
            <UserDashboardCard title="Shop Dashboard" pathname="user-dashboard/shop-dashboard"/>
          </Grid>
          <Grid item >
            <UserDashboardCard title="Shop Orders" pathname="user-dashboard/shop-orders"/>
          </Grid>
          </>}
      </Grid>
    </div>
  );
}
