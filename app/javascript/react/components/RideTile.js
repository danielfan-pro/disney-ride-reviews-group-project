import React from 'react';

const RideTile = props => {
  return (
    <div>
      <p>Name: {props.name}</p>
      <p>Location: {props.location}</p>
    </div>
  )
}

export default RideTile