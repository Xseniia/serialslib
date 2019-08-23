import React, { Component } from 'react'
import { Link } from 'react-router-dom'

class SerialCard extends Component {
  render() {
    const serial = this.props.serial

    return(
      <div className="card serial-card">
        <img src={serial.image.thumb.url} class="card-img-top" />
        <div class="card-body">
          <div class="card-content">
            <h5 class="card-title">{serial.title}</h5>
            <h6 class="card-subtitle mb-2 text-muted">{serial.year_of_premiere}</h6>

            <div class="card-text">{serial.description}</div>
          </div>

          <div class="card-links">
            <Link to={`/serials_list/${serial.id}`} class="btn btn-light">Show</Link>
            <Link to='#' class="btn btn-light">Edit</Link>
            <Link to='#' class="btn btn-light">Destroy</Link>
          </div>
        </div>
      </div>
    )
  }
}

export default SerialCard