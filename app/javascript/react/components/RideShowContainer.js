import React, { useState, useEffect } from "react";
import RideShow from "./RideShow";

const RideShowContainer = (props) => {
  const [ride, setRide] = useState({});
  const [reviews, setReviews] = useState([]);

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
    } catch (err) {
      console.error(`Error in Fetch: ${err.message}`);
    }
  };

  useEffect(() => {
    fetchRide();
  }, []);

  const addNewReview = async (payLoad) => {
    try {
      const response = await fetch(`/api/v1/rides/${rideId}/reviews`, {
        method: "POST",
        credentials: "same-origin",
        body: JSON.stringify(payLoad),
        headers: new Headers({
          "Content-Type": "application/json",
          "Accept": "application/json",
        }),
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
    />
  );
};

export default RideShowContainer;
