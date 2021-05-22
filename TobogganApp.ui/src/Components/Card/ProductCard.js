import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import CardMedia from '@material-ui/core/CardMedia';
import { Link, useLocation } from 'react-router-dom';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  root: {
    maxWidth: 350,
    maxHeight: 350,
  },
  media: {
    height: 350,
    width: 350,
  },
});

export default function ProductCard({ productData, authed, deleteProd }) {
  const classes = useStyles();
  const location = useLocation().pathname;
  console.warn(location);
  return (
    <>
    <Link className={(location === '/user-dashboard/my-shop') ? 'spaceItEdit' : 'spaceIt'} to={{
      pathname: '/productDetails',
      state: productData,
    }}>
      <CardMedia
        className={`${classes.media} ${classes.root}`}
        image={productData.productImage}
        title="ProductCards"
      >
      <div className="product-card d-flex">
          <div className="hover-content">
            <p className={`${classes.h3} product-title`}>{productData.title}</p>
            <h6 className="product-price">${productData.price}</h6>
          </div>
        </div>
        <div className="editButtons">
        <Typography variant="body2" color="textSecondary" component="p">
            {authed
            && <>
            <Link
            to={{
              pathname: '/user-dashboard/my-shop',
              state: productData,
            }}>
            <button className="btn btnSecondary m-2" onClick={() => deleteProd(productData.id)}>Delete Product</button>
            </Link>
             </>
}
          </Typography>
          </div>
      </CardMedia>
    </Link>
    </>
  );
}
