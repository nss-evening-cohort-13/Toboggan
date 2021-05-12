import React, { useState, useEffect } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { Link } from 'react-router-dom';
import Product from '../../helpers/data/productData';

const useStyles = makeStyles({
  root: {
    maxWidth: 350,
  },
  media: {
    height: 350,
    width: 350,
  },
});

export default function MediaCard({ productData, authed }) {
  const classes = useStyles();
  const deleteProduct = (productId) => {
    Product.deleteProduct(productId).then(() => {
      this.props.history.push('/user-dashboard/my-shop');
    });
  };
  return (
    <Link className="spaceIt" to={{
      pathname: '/productDetails',
      state: productData,
    }}>
    <Card className={`${classes.root} m-1 d-flex flex-column grow productCard shadow`}>
      <CardActionArea>
        <CardMedia
          className={classes.media}
          image={productData.productImage}
          title="ProductCars"
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="h2">
            {productData.title}
          </Typography>
          <Typography variant="body2" color="textSecondary" component="p">
            {productData.description}
          </Typography>
          <Typography variant="body2" color="textSecondary" component="p">
            {authed
            && <>
            <Link
            to={{
              pathname: '/productsForm',
              state: productData,
            }}>
            <button className="btn btn-primary productButtons">Edit Product</button>
            </Link>
             </>
}
          </Typography>
          <Typography variant="body2" color="textSecondary" component="p">
            {authed
            && <>
            <Link
            to={{
              pathname: '/user-dashboard/my-shop',
              state: productData,
            }}>
            <button className="btn btn-danger productButtons" onClick={() => deleteProduct(productData.id)}>Delete Product</button>
            </Link>
             </>
}
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions className='d-flex mt-auto justify-content-center'>
      </CardActions>
    </Card>
    </Link>
  );
}
