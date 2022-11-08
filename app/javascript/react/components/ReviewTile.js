import React from 'react';

const ReviewTile = (props) => {
  let reviewRating = [];
  for (let i = 0; i < props.rating; i++) {
    reviewRating.push(<i className="fa fa-coffee" aria-hidden="true"></i>);
  }
  
  return (
    <div>
      <p>{props.username}</p>
      <p>{props.created_at}</p>
      <p>Rating: {props.rating}</p>
      <p>Title: {props.title}</p>
      <p>Review: {props.body}</p> 
      <button onClick={props.upVoteClick}>Upvote</button>
      <button onClick={props.downVoteClick}>Downvote</button>
      <span>Score: {props.rating}</span>
    </div>
  )
}

export default ReviewTile