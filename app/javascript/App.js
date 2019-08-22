import React, { Component } from 'react'
import { Route, Switch } from 'react-router-dom'

import Navigation from './components/Navigation'
import Serials from './screens/serials/Serials'
import Users from './screens/users/Users'

class App extends Component {
  render () {
    return (
      <div>
        <Navigation />
        <div className='main-container'>
          <Switch>
            <Route exact path='/serials' component={Serials} />
            <Route exact path='/users' component={Users} />
            <Route exact path='/' component={Serials} />
          </Switch>
        </div>        
      </div>
    )
  }
}

export default App
