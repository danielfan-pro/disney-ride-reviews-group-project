import React, { useState } from "react"
import ErrorList from "./ErrorList"

const ReviewForm = (props) => {
  const [newReview, setNewReview] = useState({
    title: "",
    body: "",
    rating: ""
  })

  const [errors, setErrors] = useState({}) 
  
  const handleFormChange =(event) => {
    setNewReview({
      ...newReview,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  const validForSubmission = () => {
    let submitErrors = {}
    const requiredFields = ["title", "body", "rating"]
    requiredFields.forEach(field =>{
      if(newReview[field].trim() === "") {
        submitErrors = {
          ...submitErrors,
          [field]: "is blank"
        }
      }
    })
    setErrors(submitErrors)
    return _.isEmpty(submitErrors)
  }

  const handleSubmitAddNewReview = (event) => {
    event.preventDefault()
    if (validForSubmission()){
      props.addNewReview(newReview)
      setNewReview({
        title: "",
        body: "",
        rating: ""
      }
      )
    }
  }

  return (
    <div className="review-form-div">
      <button className="button write-review" type="button">Write Review</button>

      <form onSubmit={handleSubmitAddNewReview} className='new-review'>
        <ErrorList errors={errors} />
        <label htmlFor="title">Review Headline
          <input id="title" type="text" name="title" value={newReview.title} onChange={handleFormChange}/>
        </label>

        <label htmlFor="body">Review Body
          <textarea id="body" rows="4" type="text" name="body" value={newReview.body} onChange={handleFormChange}/>
        </label>

        <label htmlFor="rating">Review Rating
          <input id="rating" type="number" name="rating" value={newReview.rating} onChange={handleFormChange}/>
        </label>

        <input type="submit" />
      </form>
    </div>
)}

export default ReviewForm

