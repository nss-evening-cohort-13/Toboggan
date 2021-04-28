import React from 'react';
import shopData from '../helpers/data/shopData';
import userData from '../helpers/data/userData';
import ShopCard from '../Components/Card/ShopCard';

class Shops extends React.Component {
  state = {
    shops: [],
    users: [],
    loading: true,
  };

  componentDidMount() {
    this.getAllOfTheShops();
    this.getAllOfTheUsers();
  }

  getAllOfTheShops = () => {
    shopData.getAllShops().then((response) => {
      this.setState({
        shops: response,
      }, this.setLoading);
    });
  }

  getAllOfTheUsers = () => {
    userData.getAllUsers().then((response) => {
      this.setState({
        users: response,
      });
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

  // printUserShops = () => {
  //   const { users } = this.state;

  //   const results = users.map((user) => {
  //     if (user.shops.length) {
  //       const html = <div className='m-5'>
  //         <h1>{user.firstName}</h1>
  //         <div className='d-flex justify-content-center'>
  //           {user.shops.map((shop) => <ShopCard key={shop.id} shopData={shop} />)}
  //         </div>
  //       </div>;
  //       return html;
  //     }
  //     return [(<></>)];
  //   });

  //   return results;
  // }

  render() {
    const { shops, loading } = this.state;
    const renderShops = () => shops.slice(0, 20).map((shop) => (<ShopCard key={shop.Id} shopData={shop} />));

    return (
      <>
        {loading ? (
          <h1>Loading</h1>
        ) : (
          <div id='shops-container' className='d-flex flex-wrap justify-content-center'>
            {renderShops()}
          </div>
          //   <div id='shops-container'>
          //     {this.printUserShops()}
          //   </div>
        )}
      </>
    );
  }
}

export default Shops;
