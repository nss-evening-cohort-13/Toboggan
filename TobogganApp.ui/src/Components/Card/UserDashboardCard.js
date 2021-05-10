import React from 'react';
import { Link } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  root: {
    minWidth: 275,
    '&:hover': {
      backgroundColor: 'lightgrey',
    },
  },
  title: {
    fontSize: 14,
  },
});

export default function UserDashboardCard(props) {
  const classes = useStyles();
  return (
    <Link to={{ pathname: `${props.pathname}` }}>
      <Card className={classes.root} variant="outlined">
        <CardContent>
          <Typography className={classes.title}>
            {props.title}
          </Typography>
        </CardContent>
      </Card>
    </Link>
  );
}
