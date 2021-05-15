import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import CardMedia from '@material-ui/core/CardMedia';
import { Link } from 'react-router-dom';

const useStyles = makeStyles({
  root: {
    maxWidth: 250,
    maxHeight: 250,
  },
  media: {
    height: 250,
    width: 250,
  },
});

export default function ProductCard({ productData }) {
  const classes = useStyles();
  return (
    <Link className="spaceIt" to={{
      pathname: '/productDetails',
      state: productData,
    }}>
      <CardMedia
        className={`${classes.media} ${classes.root}`}
        image={productData.productImage}
        title="ProductCards"
      >
      <div class="product-card d-flex">
          <div class="hover-content">
            <p class={`${classes.h3} product-title`}>{productData.title}</p>
            <h6 class="product-price">${productData.price}</h6>
          </div>
        </div>
      </CardMedia>
    </Link>
  );
}
