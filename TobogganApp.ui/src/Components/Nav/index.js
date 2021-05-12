import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUserCircle } from '@fortawesome/free-solid-svg-icons';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import Auth from '../Auth';

export default function Nav() {
  return (
    <>
    <div className="navbar-container">
      <header className="brand-container mt-2">
        <Link to="/" className='brand'>Toboggan</Link>
      </header>
      <nav className="navbar">
        <div className="navbar-items">
          <Link to="/shops" className="navbar-item">
            Shops
          </Link>
          <Link to="/categories" className="navbar-item">
            Categories
          </Link>
          <Link to="/user-dashboard" className="user-icon m-2">
            <FontAwesomeIcon icon={faUserCircle} />
          </Link>
          <Link to="/shopping-cart" className="navbar-item">
            <ShoppingCartIcon />
          </Link>
        </div>
      </nav>
      <div className='user-icon-container'>
        <Auth />
      </div>
    </div>
  </>
  );
}
