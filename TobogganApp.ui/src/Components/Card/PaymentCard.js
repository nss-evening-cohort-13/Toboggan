import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardMedia from '@material-ui/core/CardMedia';

const useStyles = makeStyles({
  root: {
    maxWidth: 345,
  },
  media: {
    height: 250,
  },
});

export default function PaymentCard({ PaymentData }) {
  const classes = useStyles();
  return (
    <>
    <Card className={`${classes.root} m-1 d-flex flex-column grow`}>
          <h1>{PaymentData.name}</h1>
          <h4>{PaymentData.accountNumber}</h4>
    </Card>
    </>
  );
}
