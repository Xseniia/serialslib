import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'

import { fetchUsers, deleteUser } from '../../redux/actions'

class Users extends Component {
  componentDidMount() {
      this.props.fetchUsers()
  }

  handleDeleteUser = (e) => {
    const userId = e.target.getAttribute('value')
    this.props.deleteUser(userId, this.props.fetchUsers())
  }

  render() {
    const { users, userAdmin } = this.props;

    return (
      <div>
        <br/>
        <h1>Users</h1>

        <div className="list-group">
          {users.map(user => {
            return(
              <div className="list-group-item user-container">
                <div>
                  <div className="d-flex w-100 justify-content-between">
                    <h5 className="mb-1">{user.first_name} {user.last_name}</h5>
                  </div>
                  <p className="mb-1">{user.email}</p>
                </div>
                <div>
                  <Link to={`/user/${user.id}`} className='btn btn-light'>Show</Link>
                  {userAdmin ?
                    <span>
                      <Link to='#' className='btn btn-light'>Edit</Link>
                      <Link to='#' value={user.id} className='btn btn-light' onClick={this.handleDeleteUser}>Destroy</Link>
                    </span> : null
                  }
                </div>
              </div>
            )
          })}
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
  return {
    userSignedIn,
    userAdmin,
    users: state.users.users
   }
}

export default connect(mapStateToProps, { fetchUsers, deleteUser })(Users)
