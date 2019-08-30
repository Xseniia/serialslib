import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { connect } from 'react-redux';

class AuthorizedNav extends Component {
  render() {
    return(
      <ul className="navbar-nav">
        <li className="nav-item">
          <Link to={`/user/${this.props.userId}`} className='nav-link'>My account</Link>
        </li>
        <li className="nav-item">
          <Link to='/serials_list' className='nav-link' onClick = { this.props.handleDestroySession }>Sign out</Link>
        </li>
      </ul>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    userId: state.currentUser.user.id
  }
}

export default connect(mapStateToProps)(AuthorizedNav)
