import React from 'react';
import { Link } from 'react-router-dom';

const RideTile = props => {
  return (
      <div className='row'>
        <Link to={`/rides/${props.id}`}>
          <div className='column'>
          <img src ={props.image_url} className="propsimage"/>
          <p className='namesize1'>{props.name}</p>
          <p className='namesize'>Location: {props.location}</p>
          </div>
        </Link>
      </div>  
  )
}

export default RideTile