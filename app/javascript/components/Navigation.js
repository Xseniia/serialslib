import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { connect } from 'react-redux';

import AuthorizedNav from './AuthorizedNav'
import UnauthorizedNav from './UnauthorizedNav'

import { userSignOut } from '../redux/actions'

class Navigation extends Component {
  handleDestroySession = () => {
    this.props.userSignOut()
  }

  render() {
    const { signedIn } = this.props
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
          { signedIn ?
              <AuthorizedNav handleDestroySession = { this.handleDestroySession } /> :
              <UnauthorizedNav /> }
        </div>
      </nav>
    )
  }
}

const mapStateToProps = (state) => {
  const signedIn = state.currentUser.user != null ? true : false
  return { signedIn }
}

export default connect(mapStateToProps, { userSignOut })(Navigation)
