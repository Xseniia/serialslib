import React, { Component } from 'react'
import { connect } from 'react-redux';
import { Link } from 'react-router-dom'

import { getUserById, fetchSerialsByStatus } from '../../redux/actions'

import FavList from '../../components/users/FavList'

class UserPage extends Component {
  state = {
    status: ''
  }

  componentDidMount() {
    const id = this.props.match.params.id
    this.props.getUserById(id)
    this.props.fetchSerialsByStatus(id, this.state.status)
  }

  handleFetchSerialsByStatus = (e) => {
    const id = this.props.match.params.id
    this.setState({ [e.target.name]: e.target.value })
    this.props.fetchSerialsByStatus(id, e.target.value)
  }

  render () {
    const { currentUserId, user, country, favourites, userSerials } = this.props

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
            </p> : null
          }

          <p>
            <strong>Favourite serials: </strong>
          { favourites.length > 0 ? <FavList favourites={favourites} /> : <p>Nothing was added to favourites yet. </p> }
          </p>

          <div>
            <button name='status' className="btn btn-secondary" value="will" onClick={this.handleFetchSerialsByStatus}>Will watch</button>
            <button name='status' className="btn btn-secondary" value="now" onClick={this.handleFetchSerialsByStatus}>Watching</button>
            <button name='status' className="btn btn-secondary" value="done" onClick={this.handleFetchSerialsByStatus}>Completed</button>
            <button name='status' className="btn btn-secondary" onClick={this.handleFetchSerialsByStatus}>All</button>
          </div>
          <br/>
          <div>
            <ul>
              { userSerials.length > 0 ? userSerials.map(serial =>
                <li><Link to={`/serials_list/${serial.id}`}>{serial.title}</Link></li>
              ) : 'There is nothing in the list.' }
            </ul>
          </div>
          <Link to='/user_profile/edit' className="btn btn-secondary">Edit</Link>
        </div>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    currentUserId: state.currentUser.user,
    user: state.users.user,
    country: state.users.userCountry,
    favourites: state.users.favourites,
    userSerials: state.users.userSerials
  }
}

export default connect(mapStateToProps, { getUserById, fetchSerialsByStatus })(UserPage)
