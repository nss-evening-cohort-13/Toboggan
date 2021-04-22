import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Home from '../Components/Home';
import Shops from '../Components/Shops';
import Products from '../Components/Products';
import Categories from '../Views/ProductCategoryView';
import UserProfile from '../Components/UserProfile';

export default function Routes() {
  return (
    <Switch>
      <Route exact path='/' component={Home} />
      <Route exact path='/shops' component={Shops} />
      <Route exact path='/products' component={Products} />
      <Route exact path='/categories' component={Categories} />
      <Route exact path='/user-profile' component={UserProfile} />
    </Switch>
  );
}
