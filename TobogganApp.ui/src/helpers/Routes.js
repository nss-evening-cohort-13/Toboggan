import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Home from '../Components/Home';
// import Shops from '../Components/Shops';
import Products from '../Components/Products';
import Categories from '../Components/Categories';
import UserProfile from '../Components/UserProfile';
import Shops from '../Views/ShopView';

export default function Routes() {
  return (
    <Switch>
      <Route exact path='/' component={Home} />
      <Route exact path="/shops" component={Shops} />
      <Route exact path="/products" component={Products} />
      <Route exact path="/categories" component={Categories} />
      <Route exact path="/user-profile" component={UserProfile} />
    </Switch>
  );
}
