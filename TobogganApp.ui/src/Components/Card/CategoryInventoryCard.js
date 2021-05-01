import React from 'react';

// quick and dirty category card
export default function CategoryInventory(props) {
  const { catData } = props;
  return (
    <>
    <div className='flex-column'>
     { catData.categoryName } : { catData.itemsLeft }
    </div>
    </>
  );
}
