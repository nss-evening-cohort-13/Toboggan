import { Link } from 'react-router-dom';

export default function Nav() {
  return (
    <div className="navbar-container">
      <header className="brand-container">
        <Link to="/">
          <h1 className="brand">Toboggan</h1>
        </Link>
      </header>
      <nav className="navbar">
        <div className="navbar-items">
          <Link to="/about" className="navbar-item">
            shops
          </Link>
          <Link to="/roster" className="navbar-item">
            products
          </Link>
          <Link to="/schedule" className="navbar-item">
            categories
          </Link>
          <Link to="/highlights" className="navbar-item">
            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
          </Link>
        </div>
      </nav>
    </div>
  );
}
