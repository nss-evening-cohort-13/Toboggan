import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import CategoryInventory from './CategoryInventoryCard';
import CategorySales from './CategorySalesCard';
import OrdersToBeShipped from './ToBeShippedCard';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  paper: {
    padding: theme.spacing(2),
    textAlign: 'center',
    color: theme.palette.text.secondary,
    fontSize: '2.5rem',
  },
}));

export default function Dashboard2(props) {
  const classes = useStyles();
  const {
    totalInfo, salesThisMonth, categoryData, toBeShipped,
  } = props;

  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
        <Grid item xs>
          <Paper className={classes.paper}>
              <h2 className='titleDash'>Total sales</h2>
              ${ totalInfo && totalInfo.length > 0 ? totalInfo[0].total : ''}</Paper>
        </Grid>
        <Grid item xs>
          <Paper className={classes.paper}>
          { salesThisMonth ? `Sales this month: $${salesThisMonth.toFixed(2)}` : 'Sales this month: 0'}
          </Paper>
        </Grid>
        <Grid item xs>
          <Paper className={classes.paper}>
          <h2 className='titleDash'>Average Per Item</h2>
            ${ totalInfo && totalInfo.length > 0 ? (totalInfo[0].total / totalInfo[0].totQuantity).toFixed(2) : '' }
          </Paper>
        </Grid>
      </Grid>
      <Grid container spacing={3}>
        <Grid item xs>
          <Paper className={classes.paper}>
          <h2 className='titleDash'> Total Inventory by Category</h2>
            {categoryData && categoryData.length && categoryData.map((catData, index) => <CategoryInventory key={index} catData={catData} />)}
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className={classes.paper}>
          <h2 className='titleDash'>Total Sales by Category:</h2>
            {categoryData && categoryData.length && categoryData.map((catData, index) => <CategorySales key={index} catData={catData} />)}
          </Paper>
        </Grid>
        <Grid item xs>
          <Paper className={classes.paper}>
          <h2 className='titleDash'> Orders that require shipping</h2>
          { toBeShipped && (<OrdersToBeShipped orderData={toBeShipped} />) }
          </Paper>
        </Grid>
      </Grid>
    </div>
  );
}
