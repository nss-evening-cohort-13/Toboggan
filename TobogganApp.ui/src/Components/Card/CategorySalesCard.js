import React from 'react';

// quick and dirty category sales card

export default function CategorySales(props) {
  const { catData } = props;
  return (
      <>
      <div className='flex-column'>
       { catData.categoryName } : ${ catData.cattotal }
      </div>
      </>
  );
}
