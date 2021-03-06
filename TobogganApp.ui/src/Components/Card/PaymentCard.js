import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import AppModal from '../AppModal';
import PaymentForm from '../Forms/PaymentForm';

const useStyles = makeStyles({
  root: {
    maxWidth: 345,
  },
  media: {
    height: 250,
  },
});

export default function PaymentCard({ paymentData, onUpdate, deletePayment }) {
  const classes = useStyles();
  const typeName = (type) => {
    switch (type) {
      case 0:
        return 'MasterCard';
      case 1:
        return 'Visa';
      case 2:
        return 'Paypal';
      case 3:
        return 'Discover';
      default:
        return 'Type Not Found';
    }
  };

  return (
    <>
    <Card className={`${classes.root} m-4 p-3 d-flex flex-column grow`}>
          <h2>{typeName(paymentData.typeName)}</h2>
          <h4>{paymentData.accountNumber}</h4>
        <div className='buttonContainer m-2 d-flex '>
        <AppModal
          btnColor={'outline-info'}
          title='Update Payment'
          buttonLabel={'Update'}
          className2={'btn btnPrimary m-2'}
        >
          <PaymentForm paymentData={paymentData} onUpdate={onUpdate}/>
        </AppModal>
        <button onClick={() => deletePayment(paymentData.id)} className='btn btnTertiary m-2'>Delete Payment</button>
        </div>
    </Card>
    </>
  );
}
