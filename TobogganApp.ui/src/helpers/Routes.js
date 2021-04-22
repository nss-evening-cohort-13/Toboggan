import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Home from '../Components/Home';
import Shops from '../Components/Shops';
import Products from '../Components/Products';
import Categories from '../Components/Categories';
import UserProfile from '../Components/UserProfile';
import HomeView from '../Views/HomeView';
import ProductDetailsView from '../Views/ProductDetailsView';

export default function Routes() {
  return (
    <Switch>
      <Route exact path='/' component={HomeView} />
      <Route exact path="/shops" component={Shops} />
      <Route exact path="/products" component={Products} />
      <Route exact path='/productDetails' component={ProductDetailsView} />
      <Route exact path="/categories" component={Categories} />
      <Route exact path="/user-profile" component={UserProfile} />
    </Switch>
  );
}
