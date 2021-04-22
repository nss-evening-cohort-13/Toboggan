import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { Link } from 'react-router-dom';

const useStyles = makeStyles({
  root: {
    maxWidth: 345,
  },
  media: {
    height: 250,
  },
});

export default function MediaCard({ productData }) {
  const classes = useStyles();

  return (
    <Card className={`${classes.root} m-1 d-flex flex-column`}>
      <CardActionArea>
        <CardMedia
          className={classes.media}
          image={productData.productImage}
          title="ProductCars"
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="h2">
            {productData.title}
          </Typography>
          <Typography variant="body2" color="textSecondary" component="p">
            {productData.description}
          </Typography>
          <CardActions className='d-flex mt-auto justify-content-center'>
          <Link to={{
            pathname: 'productDetails',
            state: productData,
          }}>
          <button className="btn btn-success">Product Details</button>
          </Link>
          </CardActions>
        </CardContent>
      </CardActionArea>
    </Card>
  );
}
