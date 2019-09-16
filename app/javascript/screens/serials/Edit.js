import React, { Component } from 'react'
import { connect } from 'react-redux'

import { fetchItems, collectSerialData, updateSerial } from '../../redux/actions/'

class EditSerial extends Component {
  state = {
    id: '',
    serialImage: '',
    title: '',
    yearOfPremiere: 0,
    countryId: '',
    description: ''
  }

  refreshState = (serial) => {
    this.setState({
      id: serial.id,
      title: serial.title,
      yearOfPremiere: serial.year_of_premiere,
      countryId: serial.country_id,
      description: serial.description
    })
  }

  componentDidMount() {
    if(this.props.countriesFetched == false) this.props.fetchItems('countries')
    this.props.collectSerialData(this.props.match.params.id, '', this.refreshState)
  }

  handleImageChange = (e) => {
    this.setState({[e.target.name]: e.target.files[0]})
  }

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value })
  }

  handleUpdateSerialData = (e) => {
    e.preventDefault()
    console.log('hdfeg')
    let data = new FormData()
        data.append('serialImage', this.state.serialImage)
        data.append('title', this.state.title)
        data.append('yearOfPremiere', this.state.yearOfPremiere)
        data.append('countryId', this.state.countryId)
        data.append('description', this.state.description)

    this.props.updateSerial(this.state.id, data, )
  }

  render() {
    const { countries } = this.props

    return(
      <div>
        <form className='serial-form' onSubmit={this.handleUpdateSerialData}>
          <h2>Edit serial</h2>
          <br />
          <div className="form-group col-md-6">
            <div className="field">
              <input type="file" name='serialImage' accept="image/png image/gif image/jpeg" onChange={this.handleImageChange} class='btn btn-light' />
            </div>
          </div>

          <div className="form-row">
            <div className="form-group col-md-6">
              <label>Title: </label>
              <input type="text" name='title' className='form-control' value={this.state.title} onChange={this.handleChange} />
            </div>

            <div className="form-group col-md-6">
              <label>Year of premiere: </label>
              <input type='number' name='yearOfPremiere' className='form-control' min='1993' max='2019' value={Number(this.state.yearOfPremiere)} onChange={this.handleChange}  />
            </div>
          </div>

          <div className="form-group col-md-6">
            <label>Country: </label>
            <select name="countryId" onChange={this.handleChange} value={this.state.countryId} >
              <option value='' disabled selected>Select country</option>
              { countries.map(country => <option value={country.id} key={country.id}>{country.shortcut}  {country.country_name}</option> ) }
            </select>
          </div>

          <div className="form-group">
            <div className="field">
              <label>Description: </label>
              <textarea name='description' value={this.state.description} onChange={this.handleChange} />
            </div>
          </div>

          <button type="submit" className="btn btn-secondary">Edit</button>
        </form>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    countries: state.fetchedItems.countries,
    countriesFetched: state.fetchedItems.countriesFetched,
  }
}

export default connect(mapStateToProps, { fetchItems, collectSerialData, updateSerial })(EditSerial)
