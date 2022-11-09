import React from 'react';

const ReviewTile = (props) => {
  
  return (
    <div className="grid-x grid-margin-x">
      <div className='cell small-12 medium-8 large-8 callout'>
        <div className="grid-x">
          <p className="cell small-4 text-left username">{props.username}</p>
          <p className="cell small-4 text-left">{props.created_at}</p>
          <p className="cell small-4 text-left">Rating: {props.rating}</p>
        </div>

        <p>Title: {props.title}</p>
        <p>Review: {props.body}</p> 
      </div>

        <div className='cell medium-4 large-4'>
          <p>Extra padding</p>
        </div>
    </div>
  )
}

export default ReviewTile