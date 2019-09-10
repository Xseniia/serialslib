import React, { Component } from 'react'
import { connect } from 'react-redux'

class Tags extends Component {
  render() {
    const { tags, filter } = this.props

    return (
      <div className='filter tag-filter'>
        <h3>Tags</h3>
        { tags.map((tag, index) =>
          <a href='#'
             key={index}
             name='tag'
             value={tag.tag_name}
             onClick={filter}
             className='badge badge-light'>{tag.tag_name}</a>)
        }
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
  return { tags: state.fetchedItems.tags }
}

export default connect(mapStateToProps)(Tags)
