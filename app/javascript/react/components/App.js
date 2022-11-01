import React from 'react'
import RideIndex from './RideIndex'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

export const App = (props) => {
  return (
    <div> 
      <BrowserRouter>
        <Switch>
            <Route exact path="/rides" component={RideIndex} />
        </Switch>
     </BrowserRouter>
    </div>
  )
}

export default App
