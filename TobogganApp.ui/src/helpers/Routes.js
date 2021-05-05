import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Shops from '../Views/ShopView';
import Categories from '../Views/ProductCategoryView';
import UserProfileHistory from '../Views/UserProfileHistoryView';
import UserProfileDashboard from '../Views/UserProfileDashboardView';
import UserProfileEditShopPage from '../Views/UserProfileEditShopView';
import HomeView from '../Views/HomeView';
import ProductDetailsView from '../Views/ProductDetailsView';
import SearchProductResults from '../Views/SearchProductsResults';
import SingleShopView from '../Views/SingleShopView';
import UserDashboardView from '../Views/UserDashboardViews/UserDashboardView';
import AccountInfoView from '../Views/UserDashboardViews/AccountInfoView';
import PurchaseHistoryView from '../Views/UserDashboardViews/PurchaseHistoryView';
import MyShopView from '../Views/UserDashboardViews/MyShopView';
import ShopDashboardView from '../Views/UserDashboardViews/ShopDashboardView';
import ShopOrdersView from '../Views/UserDashboardViews/ShopOrdersView';

export default function Routes() {
  return (
    <Switch>
      <Route exact path='/' component={HomeView} />
      <Route exact path='/shops' component={Shops} />
      <Route exact path='/productDetails' component={ProductDetailsView} />
      <Route exact path='/search/:term' component={(props) => <SearchProductResults {...props}/>} />
      <Route exact path='/categories' component={Categories} />
      <Route exact path='/singleShopPage' component={SingleShopView} />
      <Route exact path="/user-profile/history/:id" component= { UserProfileHistory } />
      <Route exact path="/user-profile/dashboard/:id" component= { UserProfileDashboard } />
      <Route exact path="/user-profile/editshoppage/:id" component= { UserProfileEditShopPage } />

      {/* User Dashboard Views */}
      <Route exact path='/user-dashboard' component={UserDashboardView} />
      <Route exact path='/user-dashboard/account-info' component={AccountInfoView} />
      <Route exact path='/user-dashboard/purchase-history' component={PurchaseHistoryView} />
      <Route exact path='/user-dashboard/my-shop' component={MyShopView} />
      <Route exact path='/user-dashboard/shop-dashboard' component={ShopDashboardView} />
      <Route exact path='/user-dashboard/shop-orders' component={ShopOrdersView} />
    </Switch>
  );
}
