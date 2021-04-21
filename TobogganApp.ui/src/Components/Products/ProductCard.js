import React, { useState } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
    root: {
      maxWidth: 345,
    },
    media: {
      height: 200,
    },
  });
  
  export default function ProductCard({ productData }) {

    const classes = useStyles();
  
    return (
      <Card className={`${classes.root} m-2 d-flex flex-column`}>
        {success ? <ClimbAddedToToDo routeData={routeData}/> : <></>}
        <a href={routeData.url} target='_blank' rel='noreferrer' className='anchors'>
        <CardActionArea>
          <CardMedia
            className={classes.media}
            image={
              
            }
            title='Contemplative Reptile'
            component='img'
          />
          <CardContent className='toDoBody'>
            <Typography gutterBottom variant='h5' component='h2'>
              {routeData.name}
            </Typography>
            <Typography variant='body1' component='h3'>
              {routeData.rating}
            </Typography>
           
          </CardContent>
        </CardActionArea>
        </a>
      </Card>
    );
  }