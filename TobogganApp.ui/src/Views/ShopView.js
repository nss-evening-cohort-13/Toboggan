import React from 'react';
import shopData from '../helpers/data/shopData';
import ShopCard from '../Components/Card/ShopCard';

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
    const renderShops = () => shops.map((shop) => (<ShopCard key={shop.id} shopData={shop} />));

    return (
      <>
        {loading ? (
          <h1>Loading</h1>
        ) : (
          <>
          <div id='shops-container' className='d-flex flex-wrap justify-content-center'>
            {renderShops()}
          </div>
          </>
        )}
      </>
    );
  }
}

export default Shops;
