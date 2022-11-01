import React from 'react';

const RideTile = props => {
  return (
    // <div className='grid-x grid-padding-x small-up-4'>
    // <div className="cell">
      <div className='row'>
        <div className='column'>
      <img src = {props.image_url} className="propsimage"/>
        <p className='namesize1'>{props.name}</p>
        <p className='namesize'>Location: {props.location}</p>
        </div>
      </div>  
    // </div>
  )
}

export default RideTile