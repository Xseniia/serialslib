import React, { Component } from 'react'
import { connect } from 'react-redux'

import EditInfo from '../../components/users/EditInfo'
import EditPassword from '../../components/users/EditPassword'

class EditUser extends Component {
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

export default EditUser
