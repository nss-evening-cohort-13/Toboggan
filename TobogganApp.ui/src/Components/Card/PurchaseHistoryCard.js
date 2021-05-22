import React, { useState } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import { Box } from '@material-ui/core';
import cartData from '../../helpers/data/cartData';
import AddedToCartAlert from '../Alerts/AddedToCartAlert';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    textAlign: 'left',
    margin: theme.spacing(5),
  },
  paper: {
    padding: theme.spacing(5),
    margin: 'auto',
    maxWidth: 1000,
    minWidth: 750,
  },
  image: {
    width: 250,
    height: 250,
  },
  img: {
    margin: 'auto',
    display: 'block',
    maxWidth: '100%',
    maxHeight: '100%',
  },
}));

export default function PurchaseHistoryCard({ orderData }) {
  const [clicked, setClicked] = useState(false);
  const [addedToCart, setAddedToCart] = useState(false);
  const classes = useStyles();

  const addToCart = (e) => {
    setClicked(true);

    e.preventDefault();
    const productObject = {
      id: orderData.ProductId,
      title: orderData.Title,
      productImage: orderData.ProductImage,
      decription: orderData.Description,
      shopId: orderData.ShopId,
      price: orderData.Price,
      quantity: 1,
    };
    cartData.setCart(productObject);
    setAddedToCart(true);
    setTimeout(() => {
      setAddedToCart(false);
    }, 3500);
  };

  return (
    <div className={classes.root}>
    {addedToCart && <AddedToCartAlert productData={orderData} />}
      <Paper className={classes.paper}>
        <Grid container spacing={2}>
          <Grid item>
            <Box className={classes.image}>
              <img className={classes.img} alt="complex" src={orderData.ProductImage} />
            </Box>
          </Grid>
          <Grid item xs={12} sm container>
            <Grid item xs container direction="column" spacing={2}>
              <Grid item xs>
                <Typography gutterBottom variant="h4">
                  {orderData.Title}
                </Typography>
                <Typography variant="h5" color="textSecondary" gutterBottom>
                  {orderData.Description}
                </Typography>
              </Grid>
              <Grid item>
                <Typography variant="h6">
                  Seller: {orderData.FirstName} {orderData.LastName}
                </Typography>
              </Grid>
              <Grid item>
                <Typography variant="h6">
                 Quantity Purchased: {orderData.Quantity}
                </Typography>
              </Grid>
              <Grid item>
                <Typography variant="h6">
                 Total Cost: ${orderData.Quantity * orderData.Price}
                </Typography>
              </Grid>
            </Grid>
            <div className='d-flex align-items-center flex-column'>
            <Grid item>
              <Typography variant="h5" color="textSecondary">${orderData.Price}/each</Typography>
            </Grid>
            <button
              onClick={addToCart}
              className='btn mt-auto btnPrimary'
            >
              Buy Again
            </button>
            </div>
          </Grid>
        </Grid>
      </Paper>
    </div>
  );
}
