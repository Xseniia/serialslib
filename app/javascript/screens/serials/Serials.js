import React, { Component } from 'react'

import { fetchItems, searchSerial } from '../../redux/actions/'
import { connect } from 'react-redux';

import SerialCards from '../../components/SerialCards'
 
class Serials extends Component {
  componentDidMount() {
    if(this.props.tagsFetched === false) this.props.fetchItems('tags');
    if(this.props.genresFetched === false) this.props.fetchItems('genres');
    if(this.props.serialsFetched === false) this.props.serialSearch;
  }

  handleSubmit = (e) => {
    e.preventDefault()
  }

  handleSearchChange = (e) => {
    this.props.searchSerial(e.target.value)
  }

  render () {
    return (
      <div className='serials-container'>
        <div className='serials-head'>
          <br/>
          <h1>Serials</h1>
          <br/>

          <div className="serials-search">
            <form className='form-row' onSubmit={this.handleSubmit}>
              <input name='search' type='text' placeholder='Search' className="form-group col-md-11 serials-search-field" onChange={this.handleSearchChange}/>
              <button type='submit' className="btn btn-light col-md-1">Search</button>
            </form>
          </div>

          <br/>

          <div className='serials-body'>
            <div className='filters'>
              <div className='filter tag-filter'>
                { this.props.tags[0] ? <h3>Tags</h3> : null }
                <ul>
                  { this.props.tags.map((tag, index) => <li>{tag.tag_name}</li>) }
                </ul>
              </div>
              <div className='filter genre-filter'>
                { this.props.genres[0] ? <h3>Genres</h3> : null }
                <ul>
                  { this.props.genres.map((genre, index) => <li>{genre.title}</li>) }
                </ul>
              </div>
            </div>

            <div className='serials-container'>
              { this.props.serials[0] ? 
                <SerialCards serials={this.props.serials} /> :
                <h4>Loading serials...</h4>
              }
            </div>
          </div>
        </div>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return state.serials
}

export default connect(mapStateToProps, { fetchItems, searchSerial })(Serials)
