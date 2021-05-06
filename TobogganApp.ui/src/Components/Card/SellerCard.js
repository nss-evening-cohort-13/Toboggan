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

export default function SellerCard({ userData }) {
  const classes = useStyles();
  return (
    <>
    <Card className={`${classes.root} m-1 d-flex flex-column grow`}>
        <CardMedia
            className={classes.media}
            image={userData.ImageUrl}
            title="UserCards"
          />
          <h1>{userData.FirstName} {userData.LastName}</h1>
    </Card>
    </>
  );
}
