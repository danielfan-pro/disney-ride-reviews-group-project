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
      <div className="grid-x grid-margin-x">
        <div className="small-12 medium-8 large-8">
          <h3>{props.name}</h3>
          <h4>{props.location}</h4>
          <img src={props.image_url} alt={props.name} className="image-tile" />
        </div>

        <div className="small-12 medium-4 large-4 form-div">
          <ReviewForm addNewReview={props.addNewReview} />
        </div>
      </div>
      
        {reviewTiles}

    </div>
  );
};

export default RideShow;
