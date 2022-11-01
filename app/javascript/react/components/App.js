import React from 'react'
import RideIndex from './RideIndex'
import RideShowContainer from './RideShowContainer'

import { BrowserRouter, Route, Switch } from 'react-router-dom'

export const App = (props) => {
  return (
    <div> 
      <BrowserRouter>
        <Switch>
          <Route exact path="/rides" component={RideIndex} />
          <Route exact path="/rides/:id" component={RideShowContainer} />
        </Switch>
     </BrowserRouter>
    </div>
  )
}

export default App
