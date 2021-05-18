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
          <h2 className='titleDash'>Total sales for { salesThisMonth && salesThisMonth.length ? `${salesThisMonth[0].month}/${salesThisMonth[0].year}` : ''}:</h2>
          <h5>{ salesThisMonth && salesThisMonth.length ? salesThisMonth[0].total : ''}</h5>
          </Paper>
        </Grid>
        <Grid item xs>
          <Paper className={classes.paper}>
          <h2 className='titleDash'>Average Per Item</h2>
            <h5> { totalInfo && totalInfo.length > 0 ? (totalInfo[0].total / totalInfo[0].totQuantity).toFixed(2) : '' }
            </h5>
          </Paper>
        </Grid>
      </Grid>
      <Grid container spacing={3}>
        <Grid item xs>
          <Paper className={classes.paper}>
          <h2 className='titleDash'> Total Inventory by Category</h2>
            <h5>{categoryData && categoryData.length && categoryData.map((catData) => <CategoryInventory catData={catData} key={catData.id}/>)}
            </h5>
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className={classes.paper}>
          <h2 className='titleDash'>Total Sales by Category:</h2>
            <h5>{categoryData && categoryData.length && categoryData.map((catData) => <CategorySales catData={catData} key={catData.id}/>)}
            </h5>
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
