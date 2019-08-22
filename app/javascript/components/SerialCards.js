import React, { Component } from 'react'

class SerialCards extends Component {
  render() {
    return(
      <ul>
        { this.props.serials.map((serial, index) => <li>{serial.title}</li>) }
      </ul>
    )
  }
}

export default SerialCards