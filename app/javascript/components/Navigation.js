import React, { Component } from 'react'
import { Link } from 'react-router-dom'

class Navigation extends Component {
  render() {
    return(
      <nav className="navbar navbar-expand-lg navbar-light bg-light">
        <div className="navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav mr-auto">
            <li className="nav-item">
              <Link to='/' className='nav-link'>
                <i className="film-icon fas fa-film"></i>
              </Link>
            </li>
            <li className="nav-item">
              <Link to='/serials_list' className='nav-link'>Serials</Link>
            </li>
            <li className="nav-item">
              <Link to='/users_list' className='nav-link'>Users</Link>
            </li>
          </ul>

          <ul className="navbar-nav">

              <li className="nav-item">
                <Link to='#' className='nav-link'>My account</Link>
              </li>
              <li className="nav-item">
                <Link to='#' className='nav-link'>Sign out</Link>
              </li>

              <li className="nav-item">
                <Link to='#' className='nav-link'>Sign in</Link>
              </li>
              <li className="nav-item">
                <Link to='#' className='nav-link'>Sign up</Link>
              </li>

          </ul>
        </div>
      </nav>
    )
  }
}

export default Navigation
