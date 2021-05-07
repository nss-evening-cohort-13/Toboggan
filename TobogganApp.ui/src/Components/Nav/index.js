import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUserCircle } from '@fortawesome/free-solid-svg-icons';
import Auth from '../Auth';

export default function Nav() {
  return (
    <div className="navbar-container d-flex justify-content-center">
      <nav className="navbar">
        <div className="navbar-items">
          <Link to="/" className='brand navbar-item'>
            Toboggan
          </Link>
          <Link to="/shops" className="navbar-item">
            Shops
          </Link>
          <Link to="/categories" className="navbar-item">
            Categories
          </Link>
          <Link to="/user-dashboard" className="navbar-item">
            <FontAwesomeIcon className="user-icon" icon={faUserCircle} />
        </Link>
        </div>
      </nav>
      <div className='user-icon-container'>
        <Auth />
      </div>
    </div>
  );
}
