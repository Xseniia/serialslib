import React, { Component } from 'react'
import { connect } from 'react-redux'

import { fetchUsers, deleteUser } from '../../redux/actions'

import UserListItem from '../../components/users/UserListItem'

class Users extends Component {
  componentDidMount() {
      this.props.fetchUsers()
  }

  handleDeleteUser = (e) => {
    const userId = e.target.getAttribute('value')
    this.props.deleteUser(userId, this.props.fetchUsers)
  }

  render() {
    const { users, userAdmin } = this.props;

    return (
      <div>
        <br/>
        <h1>Users</h1>

        <div className="list-group">
          {users.map(user => <UserListItem user={user} deleteUser={this.handleDeleteUser} /> )}
        </div>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    users: state.users.users
   }
}

export default connect(mapStateToProps, { fetchUsers, deleteUser })(Users)
