import React, { Component } from 'react'
import { Link } from 'react-router-dom'

class AuthorizedNav extends Component {
  render() {
    return(
      <ul className="navbar-nav">
        <li className="nav-item">
          <Link to='#' className='nav-link'>My account</Link>
        </li>
        <li className="nav-item">
          <a className='nav-link' onClick = { this.props.handleDestroySession }>Sign out</a>
        </li>
      </ul>
    )
  }
}

export default AuthorizedNav
