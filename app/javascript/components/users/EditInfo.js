import React, { Component } from 'react'
import { connect } from 'react-redux'

import { fetchItems, authenticateUser } from '../../redux/actions/'

class EditInfo extends Component {
  state = {
    firstName: '',
    lastName: '',
    dateOfBirth: '',
    gender: '',
    countryId: null,
    email: ''
  }

  handleChange = (e) => {
    this.setState({[e.target.name]: e.target.value})
  }

  componentDidMount() {
    if(this.props.countriesFetched == false) this.props.fetchItems('countries')
  }

  render() {
    const { countries, errors } = this.props

    return(
        <form onSubmit={this.handleRegistration}>
          <br/>
          <h2>Edit</h2>

          <div className="form-row">
            <div className="form-group col-md-6">
              <label>First name: </label>
              <input type="text" className="form-control" name='firstName' value={this.state.firstName} autoFocus={true} onChange={this.handleChange} />
            </div>

            <div className="form-group col-md-6">
              <label>Last name: </label>
              <input type="text" className="form-control" name='lastName' value={this.state.lastName} onChange={this.handleChange} />
            </div>
          </div>

          <div className="form-row">
            <div className="form-group col-md-6">
              <label>Date of birth: </label>
              <input type='date' name='dateOfBirth' value={this.state.dateOfBirth} min='1970-01-01' max='2010-12-12' onChange={this.handleChange} />
            </div>

            <div className="form-group col-md-3">
              <label>Gender: </label>
              <select name='gender' onChange={this.handleChange}>
                <option value='' disabled selected>Select gender</option>
                <option value='male'>Male</option>
                <option value='female'>Female</option>
              </select>
            </div>
          </div>

          <div>
            <div className="form-group col-md-6">
              <label>Country: </label>
              <select name="countryId" onChange={this.handleChange}>
                <option value='' disabled selected>Select country</option>
                { countries.map(country => <option value={country.id} key={country.id}>{country.shortcut}  {country.country_name}</option> ) }
              </select>
            </div>

            <div className="form-group col-md-6">
              <label>Email: </label>
              <input type="text" className='form-control' name="email" value={this.state.email} onChange={this.handleChange} required></input>
            </div>
          </div>

          <button type="submit" className="btn btn-secondary">Edit</button>
        </form>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    countries: state.fetchedItems.countries,
    countriesFetched: state.fetchedItems.countriesFetched,
    errors: state.currentUser.registrationErrors
  }
}

export default connect(mapStateToProps, { fetchItems, authenticateUser })(EditInfo)
