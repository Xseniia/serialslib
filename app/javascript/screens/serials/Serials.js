import React, { Component } from 'react'
import { Link } from 'react-router-dom'

import { fetchItems, searchSerial } from '../../redux/actions/'
import { connect } from 'react-redux';

import SerialCards from '../../components/serials/SerialCards'

class Serials extends Component {
  componentDidMount() {
    if(this.props.tagsFetched === false) this.props.fetchItems('tags');
    if(this.props.genresFetched === false) this.props.fetchItems('genres');
    if(this.props.serialsFetched === false) this.props.searchSerial();
  }

  handleSubmit = (e) => {
    e.preventDefault()
  }

  handleSearchChange = (e) => {
    this.props.searchSerial(e.target.value)
  }

  handleFilter = (e) => {
    e.preventDefault()

    let name = e.target.getAttribute('name')
    let value = e.target.getAttribute('value')

    if(name === 'tag') {
      this.props.searchSerial('', value)
    } else this.props.searchSerial('', '', value)
  }

  render () {
    const serials_message = this.props.serialsFetched ? 'No serials found.' : 'Loading serials...'

    return (
      <div className='serials-container'>
        <div className='serials-head'>
          <br/>
          <h1>Serials</h1>
          <br/>

          <div className="serials-search">
            <form className='form-row'
                  onSubmit={this.handleSubmit}>
              <input name='search'
                     type='text'
                     placeholder='Search'
                     className="form-group col-md-12 serials-search-field"
                     onChange={this.handleSearchChange}/>
            </form>
          </div>

          <br/>

          <div className='serials-body'>
            <div className='filters'>
              <div className='filter tag-filter'>
                <h3>Tags</h3>
                { this.props.tags.map((tag, index) =>
                  <a href='#'
                     key={index}
                     name='tag'
                     value={tag.tag_name}
                     onClick={this.handleFilter}
                     className='badge badge-light'>{tag.tag_name}</a>)
                }
                <a href='#'
                   name='tag'
                   value=''
                   onClick={this.handleFilter}
                   className='badge badge-light'>all</a>
              </div>

              <div className='filter genre-filter'>
                <h3>Genres</h3>
                { this.props.genres.map((genre, index) =>
                  <a href='#'
                     key={index}
                     name='genre'
                     value={genre.title}
                     onClick={this.handleFilter}
                     className='badge badge-light'>{genre.title}</a>) }
                <a href='#'
                   name='tag'
                   value=''
                   onClick={this.handleFilter}
                   className='badge badge-light'>all</a>
              </div>
            </div>

            {
              this.props.serials[0] ?
              <SerialCards serials={this.props.serials} /> :
              <h4>{serials_message}</h4>
            }
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
