import React, { Component } from 'react'
import { connect } from 'react-redux';

import { getUserById } from '../../redux/actions'

class UserPage extends Component {
  componentDidMount() {
    const id = this.props.match.params.id
    this.props.getUserById(id)
  }

  render () {
    const { currentUserId, user, country } = this.props
    return(
      <div className="user-card">
        <div className="user-avatar">
          <img src='#' />
        </div>

        <div className="user-body">
          <p>
            <strong>First name: </strong>
          {user.first_name}
          </p>

          <p>
            <strong>Last name: </strong>
          {user.last_name}
          </p>

          <p>
            <strong>Gender: </strong>
          {user.gender}
          </p>

          <p>
            <strong>Date of birth: </strong>
          {user.date_of_birth}
          </p>

          <p>
            <strong>Email: </strong>
            {user.email}
          </p>

          { country ?
            <p>
              <strong>Country: </strong>
            {country}
          </p> : null}
        </div>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    currentUserId: state.currentUser.user,
    user: state.users.user,
    country: state.users.userCountry
  }
}

export default connect(mapStateToProps, { getUserById })(UserPage)
