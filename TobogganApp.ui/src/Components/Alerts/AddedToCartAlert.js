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

export default function AddedToCart({ productData }) {
  const classes = useStyles();

  return (
    <div className={`${classes.root} mb-2`}>
      <Alert severity="success">{productData.title} was added to your cart!</Alert>
    </div>
  );
}
