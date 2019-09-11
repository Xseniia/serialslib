import React, { Component } from 'react'
import { connect } from 'react-redux'

import { fetchItems, authenticateUser } from '../../redux/actions/'

class EditPassword extends Component {
  state = {
    currentPassword: '',
    newPassword: '',
    newPasswordConfirm: ''
  }

  handleChange = (e) => {
    this.setState({[e.target.name]: e.target.value})
  }

  render() {
    const { errors } = this.props

    return(
        <form>
          <h2>Change password</h2>
          <div className="form-row">
            <div className="form-group col-md-6">
              <div>
                <label>Current password: </label>
                <input type="password" autoComplete="new-password" className='form-control' name="currentPassword" value={this.state.password} minlength='6' onChange={this.handleChange} required></input>
              </div>
            </div>

            <div className='form-group col-md-6'>
              <div>
                <label>New password: </label>
                <input type="password" className="form-control" name="newPassword" value={this.state.passwordConfirmation} minlength='6' onChange={this.handleChange} required></input>
              </div>
              { this.state.newPassword.length > 0 ?
                <div>
                  <label>New password confirmation: </label>
                  <input type="password" className="form-control" name="newPasswordConfirm" value={this.state.passwordConfirmation} minlength='6' onChange={this.handleChange} required></input>
                </div> : null
               }
            </div>
          </div>
          <button type="submit" className="btn btn-secondary">Change password</button>
        </form>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    errors: state.currentUser.registrationErrors
  }
}

export default connect(mapStateToProps, { fetchItems, authenticateUser })(EditPassword)
