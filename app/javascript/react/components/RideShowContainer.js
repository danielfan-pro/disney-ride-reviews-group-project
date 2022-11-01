import RideShow from './RideShow'
import React, { useState, useEffect } from "react"

const RideShowContainer = (props) => {
  const [ride, setRide] = useState({})

  const rideId = props.match.params.rideId
  debugger
  const fetchRide = async () => {
    try {
      const response = await fetch(`/api/v1/rides/${rideId}`)
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        const error = new Error(errorMessage)
        throw (error)
      }
      const responseBody = await response.json()
      debugger
      setRide(responseBody)

    } catch (err) {
      console.error("Error in fetch!")
      console.error(err)
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
    />

    
  )
}

export default RideShowContainer