import React, { useState, useEffect } from 'react';
import UserTile from './UserTile';

const ReviewTile = (props) => {


  return (
    <div>
      <UserTile user_id={props.user_id} />
      <p>Rating: {props.rating}</p>
      <p>Title: {props.title}</p>
      <p>Review: {props.body}</p> 
    </div>
  )

}

export default ReviewTile