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
        image={review.image}
      />
    );
  });

  return (
    <div className="ride-show">
      <div className="grid-x grid-margin-x">
        <div className="small-12 medium-8 large-8">
          <h1 className="park-and-ride-title">{props.name}</h1>
          <h4>{props.location}</h4>
          <img src={props.image_url} alt={props.name} className="image-title-show ride-review-image"/>
          <h6 className="ride-tile-description">{props.description}</h6>
        </div>

        <div className="small-12 medium-4 large-4 form-div">
          <ReviewForm
            addNewReview={props.addNewReview}
            reviewButton = {props.reviewButton}
          />
        </div>
      </div>
        {reviewTiles}
    </div>
  );
};

export default RideShow;
