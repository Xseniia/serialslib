import React, { Component } from 'react'
import { Link } from 'react-router-dom'

class UnauthorizedNav extends Component {
  render() {
    return(
      <ul className="navbar-nav">
        <li className="nav-item">
          <Link to='/sign_in' className='nav-link'>Sign in</Link>
        </li>
        <li className="nav-item">
          <Link to='/sign_up' className='nav-link'>Sign up</Link>
        </li>
      </ul>
    )
  }
}

export default UnauthorizedNav
