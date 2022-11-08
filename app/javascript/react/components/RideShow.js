import React, { useState } from "react";
import ReviewTile from "./ReviewTile";
import ReviewForm from "./ReviewForm";

const RideShow = (props) => {
  const addUserVote = async (reviewId, voteValue) => {
    try {
      const voteResponse = await fetch(`/api/v1/reviews/${reviewId}/user_votes`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Accept: 'application/json',
          credentials: 'same-origin'
        },
        body: JSON.stringify({ value: voteValue })
      });
      if (voteResponse.ok) {
        const parsedVoteResponse = await voteResponse.json();
        debugger
        props.setReviews(parsedVoteResponse.reviews);
      }
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  const upVoteClick = (event) => {
    addUserVote(review.id, 1);
    event.currentTarget.style.color = '#b2ca90';
  };

  const downVoteClick = (event) => {
    addUserVote(review.id, -1);
    event.currentTarget.style.color = '#bf3310';
  };

  const reviewTiles = props.reviews.map((review) => {
    return (
      <ReviewTile
        key={review.id}
        title={review.title}
        body={review.body}
        rating={review.rating}
        created_at={review.created_at}
        username={review.user.username}
        upVoteClick={upVoteClick}
        downVoteClick={downVoteClick}
      />
    );
  });
  
  return (
    <div className="ride-show">
      <div className="image-box">
        <h1>{props.name}</h1>
        <h2>{props.location}</h2>
        <img src={props.image_url} alt={props.name} className="image-tile" />
      </div>
        {reviewTiles}

        <ReviewForm 
          addNewReview={props.addNewReview}
        />
    </div>
  );
};

export default RideShow;
