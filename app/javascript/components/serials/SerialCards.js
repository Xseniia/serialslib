import React, { Component } from 'react'

import SerialCard from './SerialCard'

class SerialCards extends Component {
  render() {
    return(
      <div className='serials-content'>
        { this.props.serials.map((serial, index) => <SerialCard serial={serial} index={index} />) }
      </div>
    )
  }
}

export default SerialCards