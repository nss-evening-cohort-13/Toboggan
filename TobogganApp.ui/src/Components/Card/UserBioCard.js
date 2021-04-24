import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  root: {
    maxWidth: 345,
  },
  media: {
    margin: 45,
    height: 250,
    width: 250,
    borderRadius: 360,
  },
});

export default function BioCard({ userData }) {
  const classes = useStyles();
  const date = new Date(userData.createdDate);
  return (
    <Card className={`${classes.root} m-1 d-flex flex-column`}>
      <CardActionArea>
        <CardMedia
          className={classes.media}
          image={userData.imageUrl}
          title="UserImage"
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="h2">
            {userData.firstName}
            {userData.lastName}
          </Typography>
          <Typography variant="body2" color="textSecondary" component="p">
            <strong>Joined</strong> {date.getMonth()}/{date.getDay()}/{date.getFullYear()}
          </Typography>
        </CardContent>
      </CardActionArea>
    </Card>
  );
}
