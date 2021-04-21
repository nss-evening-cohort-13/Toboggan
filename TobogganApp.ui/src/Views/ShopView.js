import React, { Component } from 'react';
import { GetAllShops } from '../helpers/data/shopData';


export default class ShopPageView extends Component{
    state = {
        shops: [],
    }

    componentDidMount() {
        GetAllShops().then((response) => {
            this.setState({
                shops: response,
            })
        })
    }

    render () {
      const { shops } = this.state;
      console.warn('shops', shops);
    }
    
}