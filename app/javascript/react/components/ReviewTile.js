import React from 'react';

const ReviewTile = (props) => {
  
  let reviewImage
  
  if (props.image !== null) {
    reviewImage = <a href={ props.image } target="_blank"><img src= {props.image} className="review-photo" /></a>
  }
  
  return (
    <div className="grid-x grid-margin-x">
      <div className='small-12 medium-8 large-8 callout'>
        <div className='grid-x'>
          <div className='small-8 medium-8 large-8'>
            <div className="grid-x">
              <p className="cell small-4 text-left username">{props.username}</p>
              <p className="cell small-4 text-left">{props.created_at}</p>
              <p className="cell small-4 text-left">Rating: {props.rating}</p>
            </div>

            <p>Title: {props.title}</p>
            <p>Review: {props.body}</p> 
          </div>

          <div className="grid-x small-4 medium-4 large-4">
            {reviewImage}
          </div>
        </div>
      </div>
    </div>
  )
}

export default ReviewTile