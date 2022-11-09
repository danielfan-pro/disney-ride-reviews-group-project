import React, { useState, useEffect } from "react";
import RideShow from "./RideShow";

const RideShowContainer = (props) => {
  const [ride, setRide] = useState({});
  const [reviews, setReviews] = useState([]);
  const [signedIn, setSignedIn] = useState(false)

  let reviewButton = 'hide'

  const rideId = props.match.params.id;

  const fetchRide = async () => {
    try {
      const response = await fetch(`/api/v1/rides/${rideId}`);
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        const error = new Error(errorMessage);
        throw error;
      }
      const responseBody = await response.json();
      
      setRide(responseBody.ride);
      setReviews(responseBody.ride.reviews);
      
      if (responseBody.ride.current_user !== null) {
        
        setSignedIn(true)
      }
    } catch (err) {
      console.error(`Error in Fetch: ${err.message}`);
    }
  };

    
  if (signedIn !== false) {
    reviewButton = 'show'
  }
  
  useEffect(() => {
    fetchRide();
  }, []);



  const addNewReview = async (payLoad) => {
    let body = new FormData();
    body.append("title", payLoad.title);
    body.append("body", payLoad.body);
    body.append("rating", payLoad.rating);
    body.append("ride_id", rideId);
    body.append("photo", payLoad.photo);

    try {
      const response = await fetch(`/api/v1/rides/${rideId}/reviews`, {
        method: "POST",
        credentials: "same-origin",
        body: body,
      });
      if (!response.ok) {
        const newError = new Error(`${response.status} ${response.statusText}`);
        throw newError;
      }
      const responseBody = await response.json();
      setReviews([...reviews, responseBody.review]);
    } catch (err) {
      console.error(`Error in Fetch: ${err.message}`);
    }
  };

  return (
    <RideShow
      key={ride.id}
      id={ride.id}
      name={ride.name}
      location={ride.location}
      image_url={ride.image_url}
      description={ride.description}
      reviews={reviews}
      setReviews={setReviews}
      addNewReview={addNewReview}
      reviewButton = {reviewButton}
    />
  );
};

export default RideShowContainer;
