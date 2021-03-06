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
        className={`${classes.media} ${classes.root} d-flex flex-column m-1 align-items-center product-card`}
        image={productData.productImage}
        title="ProductCards"
      >
      <div className="product-card">
          <div className="hover-content mt-5">
            <p className={`${classes.h3} product-title`}>{productData.title}</p>
            <h6 className="product-price">${productData.price}</h6>
          </div>
        </div>
      </CardMedia>
      <div className="editButtons mt-auto">
        <Typography variant="body2" color="textSecondary" component="p">
            {authed
            && <>
            <Link
            to={{
              pathname: '/user-dashboard/my-shop',
              state: productData,
            }}>
            <button className="btn btnSecondary m-1 deleteBtn" onClick={() => deleteProd(productData.id)}>Delete Product</button>
            </Link>
             </>
}
          </Typography>
          </div>
    </Link>
    </>
  );
}
