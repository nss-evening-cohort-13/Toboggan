import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUserCircle } from '@fortawesome/free-solid-svg-icons';
import React, { Component } from 'react';
import firebase from 'firebase/app';
import {
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
} from 'reactstrap';
import AuthData from '../../helpers/data/authData';

export default class Auth extends Component {
  state = {
    user: null,
  };

  componentDidMount() {
    this.removeListener = firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.setState({ user });
      } else {
        this.setState({ user: false });
      }
    });
  }

  componentWillUnmount() {
    this.removeListener();
  }

  render() {
    const { user } = this.state;

    return (
      <>
      { !user ? <button className='nav-link btn btn-primary' onClick={(e) => AuthData.loginClickEvent(e)}>Login</button>
        : <>
      {/* <img className="userInfo" src={user?.photoURL} alt={user?.displayName} /> */}
      <div className='user-icon-container'>
        <Link to="/user-dashboard" className="user-icon">
          <FontAwesomeIcon icon={faUserCircle} />
        </Link>
      </div>
      <img className="userInfo" src={user?.photoURL} alt={user?.displayName} />
              <UncontrolledDropdown>
              <DropdownToggle nav caret>
              </DropdownToggle>
            <DropdownMenu right>
            <DropdownItem>
              {user?.displayName}
              </DropdownItem>
              <DropdownItem>
                <div
                  className='nav-link btn btn-danger'
                  onClick={(e) => AuthData.logoutClickEvent(e)}
                >
                  Logout
                </div>
              </DropdownItem>
            </DropdownMenu>
          </UncontrolledDropdown>
      </>
      }
      </>
    );
  }
}
