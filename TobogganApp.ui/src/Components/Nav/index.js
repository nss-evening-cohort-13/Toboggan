import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUserCircle } from '@fortawesome/free-solid-svg-icons';
import Auth from '../Auth';

export default function Nav(props) {
  const { user } = props;
  return (
    <div className="navbar-container">
      <header className="brand-container mt-2">
        <Link to="/" className='brand'>Toboggan</Link>
      </header>
      <nav className="navbar">
        <div className="navbar-items">
          <Link to="/shops" className="navbar-item">
            shops
          </Link>
          <Link to="/categories" className="navbar-item">
            categories
          </Link>
        </div>
      </nav>
      {/* <div className='user-icon-container'>
        <Link to="/user-dashboard" className="user-icon">
          <FontAwesomeIcon icon={faUserCircle} />
        </Link>
      </div> */}
      <div className='user-icon-container'>
        <Auth />
      </div>
    </div>
  );
}
