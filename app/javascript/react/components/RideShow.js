import React, { useState } from "react";
import ReviewTile from "./ReviewTile";
import ReviewForm from "./ReviewForm";

const RideShow = (props) => {
  const reviewTiles = props.reviews.map((review) => {
    return (
      <ReviewTile
        key={review.id}
        title={review.title}
        body={review.body}
        rating={review.rating}
        created_at={review.created_at}
        username={review.user.username}
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
