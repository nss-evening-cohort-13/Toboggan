import React from 'react';
import shopData from '../helpers/data/shopData';

class Shops extends React.Component {
    state = {
      shops: [],
      loading: true,
    };

    componentDidMount() {
      this.getAllOfTheShops();
    }

    getAllOfTheShops = () => {
      shopData.getAllShops().then((response) => {
        this.setState({
          shops: response,
        }, this.setLoading);
      });
    }

    setLoading = () => {
      this.timer = setInterval(() => {
        this.setState({ loading: false });
      }, 1000);
    }

    componentWillUnmount() {
      clearInterval(this.timer);
    }

    render() {
      const { shops, loading } = this.state;
      const showShops = () => (
        shops.map((shop) => <div key={shop.Id} shop={shop}>{shop.name}</div>)
      );

      return (
            <>
            {loading ? (
              <h1>Loading</h1>
            ) : (
              showShops()
            )}
            </>
      );
    }
}

export default Shops;
