import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUserCircle } from '@fortawesome/free-solid-svg-icons';

export default function Nav() {
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
          <Link to="/products" className="navbar-item">
            products
          </Link>
          <Link to="/categories" className="navbar-item">
            categories
          </Link>
        </div>
      </nav>
      <div className='user-icon-container'>
        <Link to="/user-profile" className="user-icon">
          <FontAwesomeIcon icon={faUserCircle} />
        </Link>
      </div>
    </div>
  );
}
