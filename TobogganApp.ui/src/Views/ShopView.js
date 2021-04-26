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

  // printUserShops = (shopObject) => {
  //   if (shopObject.userId === )
  // }

  render() {
    const { shops, loading } = this.state;
    const renderShops = () => shops.slice(0, 20).map((shop) => (<ShopCard key={shop.Id} shopData={shop} />));
    const showShops = () => (
      shops.map((shop) => <div key={shop.Id} shop={shop}>{shop.name}</div>)
    );

    return (
      <>
        {loading ? (
          <h1>Loading</h1>
        ) : (
          renderShops()
        )}
      </>
    );
  }
}

export default Shops;

// export default function ShopView() {
//   return (
//     <div className='Shops'>
//       <h2>Shops Page</h2>
//     </div>
//   );
// }
