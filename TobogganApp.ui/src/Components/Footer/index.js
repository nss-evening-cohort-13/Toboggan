import React from 'react';

export default function Footer() {
  return (
    <div className="footer-container">
      <div className="footer-row">
        <div className="footer-column">
          <h3 className="brand">Toboggan</h3>
          <ul className="list-unstyled">
            <li>615-123-4567</li>
            <li>Nashville, TN</li>
            <li>333 Commerce St</li>
          </ul>
        </div>
      </div>
      <div className="footer-row">
        <p className="col-sm">
          &copy; {new Date().getFullYear()} Toboggan Inc | All rights reserved;
        </p>
      </div>
    </div>
  );
}
