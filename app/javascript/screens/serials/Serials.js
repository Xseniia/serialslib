import React, { Component } from 'react'

class Serials extends Component {
  render () {
    return (
      <div className='serials-container'>
        <div className='serials-head'>
          <br/>
          <h1>Serials</h1>
          <br/>

          <div className="serials-search">
            <form className='form-row'>
              <input type='text' placeholder='Search' className="form-group col-md-11 serials-search-field"/>
              <button type='submit' className="btn btn-light col-md-1">Search</button>
            </form>
          </div>

          <br/>

          <div className='serials-body'>
            <div className='filters'>
              <div className='filter tag-filter'>
                <h3>Tags</h3>
              </div>
              <div className='filter genre-filter'>
                <h3>Genres</h3>
              </div>
            </div>

            <div className='serials-container'>
              <h3>Serials list will be here</h3>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default Serials
