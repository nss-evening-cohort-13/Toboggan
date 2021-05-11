import React from 'react';
import { makeStyles, withTheme } from '@material-ui/core/styles';
import Box from '@material-ui/core/Box';
import Collapse from '@material-ui/core/Collapse';
import IconButton from '@material-ui/core/IconButton';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Typography from '@material-ui/core/Typography';
import Paper from '@material-ui/core/Paper';
import KeyboardArrowDownIcon from '@material-ui/icons/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@material-ui/icons/KeyboardArrowUp';
import userData from '../../helpers/data/userData';

const useRowStyles = makeStyles({
  root: {
    '& > *': {
      borderBottom: 'unset',
    },
  },
});
const rows = [];
const myRows = [];

const createRows = (orderData) => orderData.map((order) => {
  if (!myRows.includes(order.orderTableId)) {
    myRows.push(order.orderTableId);
    rows.push(createData(orderData, order.orderTableId, order.saleDate,
      order.shopName, order.totalCost));
  }
});

const createData = (orderData, orderTableId, saleDate, shopName, totalCost) => {
  const itemsAttached = orderData.filter((x) => (orderTableId === x.orderTableId));
  const lineItems = [];
  itemsAttached.forEach((item) => {
    lineItems.push({
      orderTableId: item.orderTableId,
      category: item.categoryName,
      name: item.title,
      quantity: item.quantityBought,
      price: item.price,
    });
  });
  return {
    orderTableId,
    saleDate,
    shopName,
    totalCost,
    lineItems,
  };
};

function OrderLineItems(odl) {
  return (
      <React.Fragment>
        <TableRow>
          <TableCell align="left">{odl.orderLineItem.orderTableId}</TableCell>
          <TableCell align="left">{odl.orderLineItem.category}</TableCell>
          <TableCell align="left">{odl.orderLineItem.name}</TableCell>
          <TableCell align="left">{odl.orderLineItem.quantity}</TableCell>
          <TableCell align="left">{odl.orderLineItem.price}</TableCell>
        </TableRow>
      </React.Fragment>
  );
}

function OrderRow(row) {
  const [open, setOpen] = React.useState(false);
  const classes = useRowStyles();
  return (
    <React.Fragment>
      <TableRow className={classes.root}>
        <TableCell>
          <IconButton aria-label="expand row" size="small" onClick={() => setOpen(!open)}>
            {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
          </IconButton>
        </TableCell>
        <TableCell component="th" scope="row">{row.order.saleDate}</TableCell>
        <TableCell scope="row">{row.order.orderTableId}</TableCell>
        <TableCell align="right">{row.order.shopName}</TableCell>
        <TableCell align="right">{row.order.totalCost}</TableCell>
      </TableRow>
      <TableRow>
        <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={6}>
          <Collapse in={open} timeout="auto" unmountOnExit>
            <Box margin={1}>
              <Typography variant="h6" gutterBottom component="div">
                Order Line Items:
              </Typography>
              <Table size="small" aria-label="purchases">
                <TableHead>
                  <TableRow>
                    <TableCell align="left">Order Number</TableCell>
                    <TableCell align="left">Category</TableCell>
                    <TableCell align="left">Item Name</TableCell>
                    <TableCell align="left">Quantity</TableCell>
                    <TableCell align="left">Total price ($)</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                {row.order.lineItems.map((oli) => (
                <OrderLineItems key={oli} orderLineItem={oli} />
                ))}
                </TableBody>
              </Table>
            </Box>
          </Collapse>
        </TableCell>
      </TableRow>
    </React.Fragment>
  );
}

export default function PurchaseHistoryTable(props) {
  const { orderData } = props;
  return (
    <TableContainer component={Paper}>
      <Table aria-label="collapsible table">
        <TableHead>
          <TableRow>
            <TableCell />
            <TableCell>Order Invoiced date</TableCell>
            <TableCell>Order Id</TableCell>
            <TableCell align="right">ShopName</TableCell>
            <TableCell align="right">Total Cost</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          { createRows(orderData) }
          { rows.map((row) => (<OrderRow key={row.orderTableId} order={row} />)) }
        </TableBody>
      </Table>
    </TableContainer>
  );
}
