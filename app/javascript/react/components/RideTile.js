import React from 'react';
import { Link } from 'react-router-dom';

const RideTile = props => {
  return (
      <div className='cell medium-6 small-12 large-4'>
        <Link to={`/rides/${props.id}`}>
          <div className='image-box'>
            <img src ={props.image_url} className="image-tile-index zoom-on-hover"/>
            <p className='ride-name'>{props.name}</p>
            <p className='ride-location'>Location: {props.location}</p>
          </div>
        </Link>
      </div>  
  )
}

export default RideTile