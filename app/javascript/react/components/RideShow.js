import React from "react"
import ReviewTile from "./ReviewTile"


const RideShow = (props) => {


  const reviewTiles = props.reviews.map((review) => {
    return (
      <ReviewTile
        key={review.id}
        title={review.title}
        body={review.body}
        rating={review.rating}
        user_id={review.user_id}
      />
    )

  })
  
  return (
    <div>
      <h1>{props.name}</h1>
      <h2>{props.location}</h2>
      <img src={props.image_url} alt={props.name} className="propsimage"/>
      {reviewTiles}
    </div>
  )
}

export default RideShow