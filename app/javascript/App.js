import React, { Component } from 'react'
import { Route, Switch } from 'react-router-dom'
import axios from 'axios'

import Navigation from './components/Navigation'
import Serials from './screens/serials/Serials'
import SerialItem from './screens/serials/SerialItem'
import SeasonItem from './screens/serials/SeasonItem'
import Users from './screens/users/Users'

const csrfToker = document.querySelector('[name="csrf-token"]').content
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToker
axios.defaults.headers.common['Accept'] = 'application/json'

class App extends Component {
  render () {
    return (
      <div>
        <Navigation />
        <div className='main-container'>
          <Switch>
            <Route exact path='/serials_list/:id/season/:id' component={SeasonItem} />
            <Route exact path='/serials_list/:id' component={SerialItem} />
            <Route exact path='/serials_list' component={Serials} />
            <Route exact path='/users_list' component={Users} />
            <Route exact path='/' component={Serials} />
          </Switch>
        </div>        
      </div>
    )
  }
}

export default App
