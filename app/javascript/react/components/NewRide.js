import React, { useState } from 'react';
import { Redirect } from 'react-router-dom'

const NewRide = (props) => {
  const [shouldRedirect, setShouldRedirect] = useState(false)
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
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ ride: newRide })
      })
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        const error = new Error(errorMessage)
        throw(error)
      }
      console.log("Ride was added successfully!")
      setShouldRedirect(true) 
    } catch(err) {
      console.error(`Error in fetch: ${err.message}`)
    }
    
  }

  if (shouldRedirect) {
    return <Redirect to='/rides' />
  }

  return (
      <form className='ride-form' onSubmit={handleSubmitNewRide}>
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
          <input type="text" name="description" onChange={handleInputChange} value={newRide.description}/>
        </label>

        <input type="submit" value="Add Ride" />
      </form>
  )
}

export default NewRide 