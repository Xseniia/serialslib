import React, { Component } from 'react'
import { connect } from 'react-redux'

import { fetchItems } from '../../redux/actions/'

class SignUp extends Component {
  state = {
    firstName: '',
    lastName: '',
    dateOfBirth: '',
    gender: '',
    countryId: null,
    email: '',
    password: '',
    passwordConfirmation: ''
  }

  handleChange = (e) => {
    this.setState({[e.target.name]: e.target.value})
  }

  handdleSubmit = () => {

  }

  componentDidMount() {
    if(this.props.countriesFetched == false) this.props.fetchItems('countries')
  }

  render() {
    const { countries } = this.props

    return(
      <div>
        <form>
          <br/>
          <h2>Sign up</h2>

          <div className="form-row">
            <div className="form-group col-md-6">
              <label>First name: </label>
              <input type="text" className="form-control" name='firstName' value={this.state.firstName} autoFocus={true} placeholder='Pavel' onChange={this.handleChange} />
            </div>

            <div className="form-group col-md-6">
              <label>Last name: </label>
              <input type="text" className="form-control" name='lastName' value={this.state.lastName} placeholder='Zenkovich' onChange={this.handleChange} />
            </div>
          </div>

          <div className="form-row">
            <div className="form-group col-md-6">
              <label>Date of birth: </label>
              <input type='date' name='dateOfBirth' value={this.state.dateOfBirth} onChange={this.handleChange} />
            </div>

            <div className="form-group col-md-3">
              <label>Gender: </label>
              <select name='gender' onChange={this.handleChange}>
                <option value='' disabled selected>Select gender</option>
                <option value='male'>Male</option>
                <option value='female'>Female</option>
              </select>
            </div>

            <div className="form-group col-md-6">
              <label>Country: </label>
              <select name="countryId" onChange={this.handleChange}>
                <option value='' disabled selected>Select country</option>
                { countries.map(country => <option value={country.id} key={country.id}>{country.shortcut}  {country.country_name}</option> ) }
              </select>
            </div>

            <div className="form-group col-md-6">
              <label>Email: </label>
              <input type="text" className='form-control' name="email" value={this.state.email} placeholder="pavlik@gmail.com" onChange={this.handleChange} required></input>
            </div>

            <div className="form-group col-md-6">
              <label>Password: </label>
              <input type="password" autoComplete="new-password" className='form-control' name="password" value={this.state.password} minlength='6' onChange={this.handleChange} required></input>
            </div>

            <div className="form-group col-md-6">
              <label>Password confirmation: </label>
              <input type="password" className="form-control" name="passwordConfirmation" value={this.state.passwordConfirmation} minlength='6' onChange={this.handleChange} required></input>
            </div>

            <button className="btn btn-secondary">Sign up</button>

          </div>
        </form>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    countries: state.fetchedItems.countries,
    countriesFetched: state.fetchedItems.countriesFetched
  }
}

export default connect(mapStateToProps, { fetchItems })(SignUp)
