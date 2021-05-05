import React, { Component } from 'react';
import Button from '@material-ui/core/Button';
import Box from '@material-ui/core/Box';

export default class UserDashboardView extends Component {
  render() {
    return (
      <div style={{ width: '20%' }}>
      <Box display="flex" flexDirection="column" p={1} m={1} bgcolor="background.paper">
        <Button variant="contained">Account Info</Button>
        <Button variant="contained">Purchase History</Button>
        <Button variant="contained">My Shop</Button>
        <Button variant="contained">Shop Dashboard</Button>
        <Button variant="contained">Shop Orders</Button>
      </Box>
      </div>
    );
  }
}
