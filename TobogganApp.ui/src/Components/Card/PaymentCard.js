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

export default function PaymentCard({ paymentData }) {
  const classes = useStyles();
  const typeName = (type) => {
    switch (type) {
      case 0:
        return 'MasterCard';
        break;
      case 1:
        return 'Visa';
        break;
      case 2:
        return 'Paypal';
        break;
      case 3:
        return 'Discover';
        break;
    }
    return 'Type Not Found';
  };
  return (
    <>
    <Card className={`${classes.root} m-1 d-flex flex-column grow`}>
          <h1>{typeName(paymentData.typeName)}</h1>
          <h4>{paymentData.accountNumber}</h4>
    </Card>
    </>
  );
}
