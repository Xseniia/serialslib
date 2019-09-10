import React, { Component } from 'react'
import { connect } from 'react-redux'

class Genres extends Component {
  render() {
    const { genres, filter } = this.props

    return (
      <div className='filter genre-filter'>
        <h3>Genres</h3>
        { genres.map((genre, index) =>
          <a href='#'
             key={index}
             name='genre'
             value={genre.title}
             onClick={filter}
             className='badge badge-light'>{genre.title}</a>) }
        <a href='#'
           name='tag'
           value=''
           onClick={filter}
           className='badge badge-light'>all</a>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return { genres: state.fetchedItems.genres }
}

export default connect(mapStateToProps)(Genres)
