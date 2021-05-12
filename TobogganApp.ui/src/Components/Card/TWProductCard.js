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
    maxWidth: 345,
  },
  media: {
    height: 250,
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
<div class="flex">
  <div class="flex-none w-48 relative">
    <img src={productData.productImage} alt="product" class="absolute inset-0 w-full h-full object-cover" />
  </div>
  <form class="flex-auto p-6">
    <div class="flex flex-wrap">
      <h1 class="flex-auto text-xl font-semibold">
        Classic Utility Jacket
      </h1>
      <div class="text-xl font-semibold text-gray-500">
        $110.00
      </div>
      <div class="w-full flex-none text-sm font-medium text-gray-500 mt-2">
        In stock
      </div>
    </div>
    <div class="flex space-x-3 mb-4 text-sm font-medium">
      <div class="flex-auto flex space-x-3">
        <button class="w-1/2 flex items-center justify-center rounded-md bg-black text-white" type="submit">Buy now</button>
        <button class="w-1/2 flex items-center justify-center rounded-md border border-gray-300" type="button">Add to bag</button>
      </div>
      <button class="flex-none flex items-center justify-center w-9 h-9 rounded-md text-gray-400 border border-gray-300" type="button" aria-label="like">
        <svg width="20" height="20" fill="currentColor">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" />
        </svg>
      </button>
    </div>
    <p class="text-sm text-gray-500">
      Free shipping on all continental US orders.
    </p>
  </form>
</div>

  );
}
    