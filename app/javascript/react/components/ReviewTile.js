import React from 'react';

const ReviewTile = (props) => {
  
  let reviewImage
  
  if (props.image !== null) {
    reviewImage = <a data-open="modal-image" ><img src= {props.image} className="review-photo" /></a>
  }
  
  return (
    <div className="grid-x grid-margin-x">
      <div className='small-12 medium-8 large-8 callout'>
        <div className="grid-x">
          <p className="cell small-4 text-left username">{props.username}</p>
          <p className="cell small-4 text-left">{props.created_at}</p>
          <p className="cell small-4 text-left">Rating: {props.rating}</p>
        </div>

        <p>Title: {props.title}</p>
        <p>Review: {props.body}</p> 

        {reviewImage}
        
        <div className="full reveal" id="modal-image" data-reveal>
          <img src={props.image} />
          <button className="close-button" data-close aria-label="Close modal" type="button">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      </div>
    </div>
  )
}

export default ReviewTile