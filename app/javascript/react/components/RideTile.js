import React from 'react';
import { Link } from 'react-router-dom';

const RideTile = props => {
  return (
      <div className='column cell medium-6 small-12 large-3'>
        <Link to={`/rides/${props.id}`}>
          <div className='column'>
            <img src ={props.image_url} className="imagetile"/>
            <p className='namesize1'>{props.name}</p>
            <p className='namesize'>Location: {props.location}</p>
          </div>
        </Link>
      </div>  
  )
}

export default RideTile