import React from 'react';

const RideTile = props => {
  return (
      <div className='row'>
        <a href={'/rides/' + props.id}>
          <div className='column'>
          <img src ={props.image_url} className="propsimage"/>
          <p className='namesize1'>{props.name}</p>
          <p className='namesize'>Location: {props.location}</p>
          </div>
        </a>
      </div>  
  )
}

export default RideTile