import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Alert from '@material-ui/lab/Alert';

const useStyles = makeStyles((theme) => ({
  root: {
    width: '100%',
    '& > * + *': {
      marginTop: theme.spacing(2),
    },
  },
}));

export default function NotEnoughProductInStock({ productData }) {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Alert severity="error">Only {productData.quantity} {productData.title}s in stock</Alert>
    </div>
  );
}
