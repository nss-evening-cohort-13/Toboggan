import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import userData from '../../helpers/data/userData';

export default class AccountInfoView extends Component {
  state = {
    user: '',
  }

  componentDidMount() {
    userData.getSingleUser(this.props.user?.uid).then((response) => {
      this.setState({
        user: response,
      });
    });
  }

  render() {
    const { user } = this.state;

    return (
      <>
      <div>
        <h2>Account Info</h2>
      </div>
      <Link
        to={{
          pathname: '/paymentType',
          state: user,
        }}>
        <button className="btn btn-warning m-4">
          Payment Types
        </button>
      </Link>
      </>
    );
  }
}
