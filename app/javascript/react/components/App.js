import React from 'react'
import RideIndex from './RideIndex'
import RideShowContainer from './RideShowContainer'

import { BrowserRouter, Route, Switch } from 'react-router-dom'

export const App = (props) => {
  return (
      <BrowserRouter>
        <Switch>
          <Route exact path="/" component={RideIndex} />
          <Route exact path="/rides" component={RideIndex} />
          <Route exact path="/rides/:id" component={RideShowContainer} />
        </Switch>
     </BrowserRouter>
  )
}

export default App
