import React from 'react';

const ReviewTile = (props) => {
  
  return (
    <div>
      <p>{props.username}</p>
      <p>{props.created_at}</p>
      <p>Rating: {props.rating}</p>
      <p>Title: {props.title}</p>
      <p>Review: {props.body}</p> 
    </div>
  )
}

export default ReviewTile