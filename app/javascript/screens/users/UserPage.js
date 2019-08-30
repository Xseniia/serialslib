import React, { Component } from 'react'
import { connect } from 'react-redux';

class UserPage extends Component {
  render () {
    const { user } = this.props
    return(
      <div>Hello { user.email }</div>
    )
  }
}

const mapStateToProps = (state) => {
  return state.currentUser
}

export default connect(mapStateToProps)(UserPage)
