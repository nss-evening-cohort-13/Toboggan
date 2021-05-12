import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom';
import Shops from '../Views/ShopView';
import Categories from '../Views/ProductCategoryView';
import HomeView from '../Views/HomeView';
import ProductDetailsView from '../Views/ProductDetailsView';
import SearchResults from '../Views/SearchResults';
import SingleShopView from '../Views/SingleShopView';
import ProductsForm from '../Components/Forms/ProductsForm';
import ShopForm from '../Components/Forms/ShopForm';
import UserDashboardView from '../Views/UserDashboardViews/UserDashboardView';
import AccountInfoView from '../Views/UserDashboardViews/AccountInfoView';
import ShopOrderView from '../Views/UserDashboardViews/ShopOrderView';
import MyShopView from '../Views/UserDashboardViews/MyShopView';
import ShopDashboardView from '../Views/UserDashboardViews/ShopDashboardView';
import CreateShopView from '../Views/UserDashboardViews/CreateShopView';
import PurchaseHistoryView from '../Views/UserDashboardViews/PurchaseHistoryView';
import PaymentTypeView from '../Views/PaymentTypeView';
import PleaseLogin from '../Views/PleaseLogin';

export default function Routes({ user, authed }) {
  return (
    <Switch>
      <Route exact path='/' component={HomeView} />
      <Route exact path='/shops' component={Shops} />
      <Route exact path='/productDetails' component={(props) => <ProductDetailsView {...props} authed={authed} user={user} />} />
      <Route exact path='/productsForm' component={(props) => <ProductsForm {...props} user={user}/>}/>
      <Route exact path='/search/:term' component={(props) => <SearchResults {...props}/>} />
      <Route exact path='/categories' component={Categories} />
      <Route exact path='/singleShopPage' component={SingleShopView} />
      <Route exact path='/shopForm' component={(props) => <ShopForm {...props} user={user}/>}/>
      <Route exact path='/paymentType' component={PaymentTypeView} />
      <Route exact path='/pleaseLogin' component={PleaseLogin}/>

      {/* User Dashboard Views */}
      <PrivateRoute exact path='/user-dashboard' user={user} component={UserDashboardView} />
      <PrivateRoute exact path='/user-dashboard/account-info' user={user} component={AccountInfoView} />
      <PrivateRoute exact path='/user-dashboard/create-shop' user={user} component={CreateShopView} />
      <PrivateRoute exact path='/user-dashboard/purchase-history' user={user} component={() => <PurchaseHistoryView user={user}/>} />
      <PrivateRoute exact path='/user-dashboard/my-shop' user={user} component={(props) => <MyShopView {...props} user={user}/> } />
      <PrivateRoute exact path='/user-dashboard/shop-dashboard' user={user} component={() => <ShopDashboardView user={user}/>} />
      <PrivateRoute exact path='/user-dashboard/shop-orders' user={user} component={(props) => <ShopOrderView {...props} user={user}/>} />
    </Switch>
  );
}

const PrivateRoute = ({ component: Component, user, ...rest }) => {
  const routeChecker = (taco) => (user
    ? (<Component {...taco} user={user}/>)
    : (<Redirect to={{ pathname: '/pleaseLogin', state: { from: taco.location } }} />));

  return <Route {...rest} render={(props) => routeChecker(props)}/>;
};
