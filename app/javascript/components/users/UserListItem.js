import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'

class UserListItem extends Component {
  render() {
    const { user, userAdmin, deleteUser, currUser } = this.props
    console.log(currUser)

    return(
      <div className="list-group-item user-container">
        <div>
          <div className="d-flex w-100 justify-content-between">
            <h5 className="mb-1">{user.first_name} {user.last_name}</h5>
          </div>
          <p className="mb-1">{user.email}</p>
        </div>
        <div>
          <Link to={`/user_profile/${user.id}`} className='btn btn-light'>Show</Link>
          {(userAdmin || currUser == user.id) ?
            <span>
              <Link to='#' className='btn btn-light'>Edit</Link>
              <Link to='#' value={user.id} className='btn btn-light' onClick={deleteUser}>Destroy</Link>
            </span> : null
          }
        </div>
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

  return { userAdmin, currUser: state.currentUser.user.id }
}

export default connect(mapStateToProps)(UserListItem)
