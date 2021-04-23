import React, { useState, useEffect } from 'react';
import BioCard from '../Components/Card/UserBioCard';
import fetchUserData from '../helpers/data/userData';

export default function UserProfileView(props) {
  const [userInfo, setUserInfo] = useState([]);
  const [error, updateError] = useState([]);
  const { id } = props.match.params;
  console.warn(id);

  useEffect(() => { // Pass in a callback function!
    fetchUserData(id)
      .then((data) => {
        setUserInfo(data);
      });
  }, []);

  return (
    <div className='User-Profile'>
      <h2>User Profile Page</h2>
      <BioCard userData={ userInfo }/>
    </div>
  );
}
