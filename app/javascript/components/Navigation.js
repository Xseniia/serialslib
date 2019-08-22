import React, { Component } from 'react'

class Navigation extends Component {
  render() {
    return(
      <nav className="navbar navbar-expand-lg navbar-light bg-light">
        <div className="navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav mr-auto">
            <li className="nav-item">
              <a href='#' className='nav-link'>
                <i className="film-icon fas fa-film"></i>
              </a>
            </li>
            <li className="nav-item">
              <a href='#' className='nav-link'>Serials</a>
            </li>
            <li className="nav-item">
              <a href='#' className='nav-link'>Users</a>
            </li>
          </ul>

          <ul className="navbar-nav">

              <li className="nav-item">
                <a href='#' className='nav-link'>My account</a>
              </li>
              <li className="nav-item">
                <a href='#' className='nav-link'>Sign out</a>
              </li>

              <li className="nav-item">
                <a href='#' className='nav-link'>Sign in</a>
              </li>
              <li className="nav-item">
                <a href='#' className='nav-link'>Sign up</a>
              </li>

          </ul>
        </div>
      </nav>
    )
  }
}

export default Navigation
