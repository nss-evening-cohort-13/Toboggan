import React, { useState, useEffect } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardMedia from '@material-ui/core/CardMedia';
import { Link } from 'react-router-dom';

const useStyles = makeStyles({
  // TO DO: Fix product cards on shop view
  // TO DO: product image on product details view
  root: {
    maxWidth: 250,
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
    <Card
      className={`${classes.root} m-1 d-flex flex-column productCard`}
      >
        <CardMedia
          className={classes.media}
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
    </Card>
    </Link>
  );
}
