import React from 'react';
import { Link } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardMedia from '@material-ui/core/CardMedia';

const useStyles = makeStyles({
  root: {
    maxWidth: 345,
    marginTop: '20px',
  },
  media: {
    height: 350,
    minWidth: 400,
  },
  card: {
    position: 'relative',
    margin: '10px !important',
    boxShadow: '-10px -10px #137a94',
  },
  overlay: {
    position: 'absolute',
    color: 'white',
    fontWeight: 'bolder',
    textAlign: 'center',
    width: '100%',
  },
});

export default function ShopCard({ shopData }) {
  const classes = useStyles();
  return (
    <>
    <Link
        to={{
          pathname: '/singleShopPage',
          state: shopData.id,
        }}
        >
    <Card className={`${classes.root} ${classes.card} m-1 d-flex flex-column grow`}>
        <CardMedia
            className={classes.media}
            image={shopData.shopImage}
            title="ShopCards"
          />
          <div className={`${classes.overlay} overlay${shopData.id % 3}`}>
          <h1>{shopData.name}</h1>
          </div>
        </Card>
    </Link>

    </>
  );
}
