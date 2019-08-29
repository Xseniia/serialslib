import React, { Component } from 'react'
import { Route, Switch } from 'react-router-dom'
import axios from 'axios'
import { connect } from 'react-redux';

import Navigation from './components/Navigation'
import SignIn from './screens/users/SignIn'
import SignUp from './screens/users/SignUp'

import Serials from './screens/serials/Serials'
import SerialItem from './screens/serials/SerialItem'
import SeasonItem from './screens/serials/SeasonItem'

import Users from './screens/users/Users'

import { getCurrentUser } from './redux/actions'

const csrfToken = document.querySelector('[name="csrf-token"]').content
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken
axios.defaults.headers.common['Accept'] = 'application/json'

class App extends Component {
  componentDidMount = () => {
    this.props.getCurrentUser()
  }

  render () {
    return (
      <div>
        <Navigation />
        <div className='main-container'>
          <Switch>
            <Route exact path='/sign_in' component={SignIn} />
            <Route exact path='/sign_up' component={SignUp} />
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

export default connect(null, { getCurrentUser })(App)
