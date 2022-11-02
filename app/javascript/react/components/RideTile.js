import React from 'react';

const RideTile = props => {
  return (
      <div className='row'>
        <div className='column'>
        <a href={'/rides/' + props.id}><img src = {props.image_url} className="propsimage"/></a>
        <p className='namesize1'>{props.name}</p>
        <p className='namesize'>Location: {props.location}</p>
        </div>
      </div>  
  )
}

export default RideTile