import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { connect } from 'react-redux';

import SerialCard from './SerialCard'

class SerialCards extends Component {
  render() {
    const { userSignedIn, userAdmin } = this.props

    return(
      <div className='serials-content-container'>
        <div className='serials-content'>
          { this.props.serials.map((serial, index) => <SerialCard serial={serial} index={index} userSignedIn={this.props.userSignedIn} userAdmin={this.props.userAdmin} />) }
        </div>
        { userAdmin ?
          <Link to='#' className="btn btn-light add-serial-btn">Add serial</Link> : null }
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  const userSignedIn = state.currentUser.user != null ? true : false
  let userAdmin = false

  if(userSignedIn && state.currentUser.user.admin) {
    userAdmin = true
  }
  return { userSignedIn, userAdmin }
}

export default connect(mapStateToProps)(SerialCards)
