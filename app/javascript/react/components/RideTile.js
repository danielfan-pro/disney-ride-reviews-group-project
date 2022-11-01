import React from 'react';

const RideTile = props => {
  return (
    <div>
      <p>Name: {props.name}</p>
      <p>Location: {props.location}</p>
      <img src = {props.image_url} className="ride_image"/>
    </div>
  )
}

export default RideTile