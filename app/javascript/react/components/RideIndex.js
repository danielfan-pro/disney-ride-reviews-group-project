import React, { useState, useEffect } from 'react';
import RideTile from './RideTile'
import SearchBar from './SearchBar.js';

const RideIndex = (props) => {
  const [rides, setRides] = useState([])

  const getRides = async () => {
    try {
      const response = await fetch("/api/v1/rides")
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      setRides(responseBody.rides)
      
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  useEffect(() => {
    getRides()
  }, [])
  const rideTiles = rides.map(ride => {
    return (
      <RideTile
        key={ride.id}
        id={ride.id}
        name={ride.name}
        location={ride.location}
        image_url={ride.image_url}
      />
    )
  })

  return (
    <div>
      <h1>Ride Reviews</h1>
      <SearchBar 
        rides={rides}
        setRides={setRides}
      />
      {rideTiles}
    </div>

  ) 

}

export default RideIndex
