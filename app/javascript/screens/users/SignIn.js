import React, { Component } from 'react'
import { connect } from 'react-redux';

import { userSignIn } from '../../redux/actions/'

class SignIn extends Component {
  state = {
    email: '',
    password: ''
  }

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value })
    console.log(this.state)
  }

  handleLogIn = (e) => {
    e.preventDefault()
    const { email, password } = this.state
    this.props.userSignIn(email, password)
  }

  render() {
    return(
      <div>
        <form onSubmit={this.handleLogIn}>
          <h2>Log in</h2>

          <div className='form-group col-md-7'>
            <label>Email</label>
            <input type='text' name='email' value={this.state.email} autoFocus={true} placeholder='email' autoComplete='email' className='form-control' onChange={this.handleChange}></input>
          </div>
          <div className='form-group col-md-7'>
            <label>Password</label>
            <input type='password' name='password' value={this.state.password} placeholder='password' autoComplete='current_password' className='form-control' onChange={this.handleChange}></input>
          </div>
          <div className='actions'>
            <button type='submit' className='btn btn-secondary'>Log in</button>
          </div>
        </form>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return state;
}

export default connect( mapStateToProps, { userSignIn })(SignIn)