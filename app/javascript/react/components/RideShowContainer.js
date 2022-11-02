import React, { useState, useEffect } from "react"
import RideShow from './RideShow'

const RideShowContainer = (props) => {
  const [ride, setRide] = useState({})
  const [reviews, setReviews] = useState([])
  
  const rideId = props.match.params.id
  
  const fetchRide = async () => {
    try {
      
      const response = await fetch(`/api/v1/rides/${rideId}`)
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        const error = new Error(errorMessage)
        throw (error)
      }
      const responseBody = await response.json()
      
      setRide(responseBody.ride)
      setReviews(responseBody.reviews)
      
    } catch (err) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  useEffect(() => {
    fetchRide()
  }, [])

  
  return (
    <RideShow
      id={ride.id}
      name={ride.name}
      location={ride.location}
      image_url={ride.image_url}
      description={ride.description}
      reviews={reviews}
    />    
  )
}

export default RideShowContainer