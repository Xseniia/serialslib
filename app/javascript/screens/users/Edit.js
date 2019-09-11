import React, { Component } from 'react'
import { connect } from 'react-redux'

import EditInfo from '../../components/users/EditInfo'
import EditPassword from '../../components/users/EditPassword'

class SignUp extends Component {
  render() {
    return(
      <div>
        <EditInfo />
        <br />
        <EditPassword />
      </div>
    )
  }
}

export default SignUp
