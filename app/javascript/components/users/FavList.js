import React, { Component } from 'react'
import { Link } from 'react-router-dom'

class FavList extends Component {
  render() {
    return(
      <ul>
        { this.props.favourites.map((fav, i) =>
          <li>
            <Link to={`/serials_list/${fav.id}`}>{fav.title}</Link>
          </li>
        ) }
      </ul>
    )
  }
}

export default FavList
