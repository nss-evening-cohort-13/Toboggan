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
    width: 250,
  },
});

export default function ShopCard({ shopData }) {
  const classes = useStyles();
  return (
    <Card className={`${classes.root} m-1 d-flex flex-column`}>
        {/* update sql server database to get shop images */}
      <CardMedia
          className={classes.media}
          image={shopData.shopImage}
          title="ShopCards"
        />
        <h1>{shopData.name}/{shopData.userId}</h1>
    </Card>
  );
}
