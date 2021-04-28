import React from 'react';
import shopData from '../helpers/data/shopData';
import userData from '../helpers/data/userData';
import ShopCard from '../Components/Card/ShopCard';

class Shops extends React.Component {
  state = {
    users: [],
    loading: true,
  };

  componentDidMount() {
    this.getAllOfTheUsers();
  }

  getAllOfTheShops = () => {
    shopData.getAllShops().then((response) => {
      this.setState({
        shops: response,
      });
    });
  }

  getAllOfTheUsers = () => {
    userData.getAllUsers().then((response) => {
      this.setState({
        users: response,
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

    printUserShops = () => {
      const { users } = this.state;

      const results = users.map((user) => {
        if (user.shops.length) {
          const html = <div className='m-5'>
            <h1>{user.firstName}</h1>
            <div className='d-flex justify-content-center'>
              {user.shops.map((shop) => <ShopCard key={shop.id} shopData={shop} />)}
            </div>
          </div>;
          return html;
        }
        return [(<></>)];
      });

      return results;
    }

    render() {
      const { loading } = this.state;

      return (
        <>
          {loading ? (
            <h1>Loading</h1>
          ) : (
              <div id='shops-container'>
                {this.printUserShops()}
              </div>
          )}
        </>
      );
    }
}

export default Shops;
