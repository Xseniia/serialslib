import React, { Component } from 'react'
import { Link } from 'react-router-dom'

class SerialCard extends Component {
  render() {
    const { serial } = this.props
    const { userSignedIn, userAdmin } = this.props

    return(
      <div className="card serial-card">
        <img src={serial.image.thumb.url} className="card-img-top" />
        <div className="card-body">
          <div className="card-content">
            <h5 className="card-title">{serial.title}</h5>
            <h6 className="card-subtitle mb-2 text-muted">{serial.year_of_premiere}</h6>

            <div className="card-text">{serial.description}</div>
          </div>

          <div className="card-links">
            <Link to={`/serials_list/${serial.id}`} className="btn btn-light">Show</Link>
            { userAdmin ?
                <span><Link to={`/serials_list/${serial.id}/edit`} className="btn btn-light">Edit</Link>
                <Link to='#' className="btn btn-light">Destroy</Link></span> :
                null }
          </div>
        </div>
      </div>
    )
  }
}

export default SerialCard
