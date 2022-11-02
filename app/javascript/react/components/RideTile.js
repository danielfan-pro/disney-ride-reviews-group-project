import React from 'react';

const RideTile = props => {
  return (
        <div className='column cell medium-6 small-12 large-3'>
            <img src = {props.image_url} className="propsimage"/>
          <p className='namesize1'>{props.name}</p>
          <p className='namesize'>Location: {props.location}</p>
        </div> 
  )
}

export default RideTile