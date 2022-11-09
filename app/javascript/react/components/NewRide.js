import React, { useState } from 'react';
import { Redirect } from 'react-router-dom'

const NewRide = (props) => {
  const [redirect, setRedirect] = useState(null)
  const [newRide, setNewRide] = useState({
    name: "",
    location: "",
    image_url: "",
    description: ""
  })

  const location = ['','Frontierland', 'Fantasyland', 'Liberty Square', 'Tomorrowland', 'Adventureland', 'Main Street, U.S.A' ]

  const locationOptions = location.map(location => {
    return (
      <option key={location} value={location}>
        {location}
      </option>
    )
  })

  const handleInputChange = (event) => {
    setNewRide({
      ...newRide,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  const handleSubmitNewRide = async (event) => {
    event.preventDefault()
    try {
      const response = await fetch('/api/v1/rides', {
        method: "POST",
        credentials: "same-origin",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json" 
        },
        body: JSON.stringify({ ride: newRide })
      })
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        const error = new Error(errorMessage)
        throw(error)
      }

      const rideBody = await response.json()
   
      if (rideBody.ride) {
        console.log("Ride was added successfully!")
        setRedirect(rideBody.ride.id)
      } else if (rideBody.error[0] === "Only admins have access to this feature") {
        alert("Only admins have access to this feature")
      }  
      
    } catch(err) {
      console.error(`Error in fetch: ${err.message}`)
    }
    
  }

  if (redirect !== null) {
    return <Redirect to={`/rides/${redirect}`} />
  }

  return (
    <div className='new-ride-div'>
      <h1>Add New Ride</h1>
      <form className='new-ride' onSubmit={handleSubmitNewRide}>
        <label>
          Ride Name:
          <input type="text" name="name" onChange={handleInputChange} value={newRide.name}/>
        </label>

        <label>
          Location:
          <select type="text" name="location" onChange={handleInputChange} value={newRide.location} >
            {locationOptions}
          </select>           
        </label>

        <label>
          Image_url:
          <input type="text" name="image_url" onChange={handleInputChange} value={newRide.image_url}/>
        </label>

        <label>
          Description:
          <textarea type="text" name="description" onChange={handleInputChange} value={newRide.description}/>
        </label>

        <input type="submit" value="Add Ride" />
      </form>
    </div>    
  )
}

export default NewRide 