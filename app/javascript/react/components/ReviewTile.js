import React, { useState, useEffect } from 'react';
import UserTile from './UserTile';

const ReviewTile = (props) => {
  
  return (
    <div>
      <UserTile username={props.username} />
      <p>Created at: {props.created_at} </p>
      <p>Rating: {props.rating}</p>
      <p>Title: {props.title}</p>
      <p>Review: {props.body}</p> 
    </div>
  )
}

export default ReviewTile