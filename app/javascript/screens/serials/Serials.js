import React, { Component } from 'react'
import { Link } from 'react-router-dom'

import { fetchItems, searchSerial } from '../../redux/actions/'
import { connect } from 'react-redux';

import Search from '../../components/serials/Search'
import SerialCards from '../../components/serials/SerialCards'
import Tags from '../../components/serials/Tags'
import Genres from '../../components/serials/Genres'

class Serials extends Component {
  componentDidMount() {
    if(this.props.tagsFetched === false) this.props.fetchItems('tags');
    if(this.props.genresFetched === false) this.props.fetchItems('genres');
    if(this.props.serials.serialsFetched === false) this.props.searchSerial();
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
    const serials_message = this.props.serials.serialsFetched ? 'No serials found.' : 'Loading serials...'

    return (
      <div className='serials-container'>
        <div className='serials-head'>
          <br/>
          <h1>Serials</h1>
          <br/>

          <Search submit={this.handleSubmit} searchChange={this.handleSearchChange} />

          <br/>

          <div className='serials-body'>
            <div className='filters'>
              <Tags filter={this.handleFilter} />
              <Genres filter={this.handleFilter} />
            </div>

            {
              this.props.serials.serials[0] ?
              <SerialCards serials={this.props.serials.serials} /> :
              <h4>{serials_message}</h4>
            }
          </div>
        </div>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    serials: state.serials,
    tagsFetched: state.fetchedItems.tagsFetched,
    genresFetched: state.fetchedItems.genresFetched
  }
}

export default connect(mapStateToProps, { fetchItems, searchSerial })(Serials)
