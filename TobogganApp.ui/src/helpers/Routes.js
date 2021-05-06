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
import ProductsForm from '../Components/Forms/ProductsForm';

export default function Routes({ user }) {
  return (
    <Switch>
      <Route exact path='/' component={HomeView} />
      <Route exact path='/shops' component={Shops} />
      <Route exact path='/productDetails' component={ProductDetailsView} />
      <Route exact path='/productsForm' component={(props) => <ProductsForm {...props} user={user}/>}/>
      <Route exact path='/search/:term' component={(props) => <SearchProductResults {...props}/>} />
      <Route exact path='/categories' component={Categories} />
      <Route exact path='/singleShopPage' component={SingleShopView} />
      <Route exact path="/user-profile/history/:id" component= { UserProfileHistory } />
      <Route exact path="/user-profile/dashboard/:id" component= { UserProfileDashboard } />
      <Route exact path="/user-profile/editshoppage/:id" component= { UserProfileEditShopPage } />
    </Switch>
  );
}
