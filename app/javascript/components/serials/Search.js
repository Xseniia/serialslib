import React, { Component } from 'react'

class Search extends Component {
  render() {
    const { submit, searchChange } = this.props
    return(
      <div className="serials-search">
        <form className='form-row'
              onSubmit={submit}>
          <input name='search'
                 type='text'
                 placeholder='Search'
                 className="form-group col-md-12 serials-search-field"
                 onChange={searchChange}/>
        </form>
      </div>
    )
  }
}

export default Search
