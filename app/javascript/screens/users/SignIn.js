import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { connect } from 'react-redux';

import { userSignIn } from '../../redux/actions/'

class SignIn extends Component {
  state = {
    email: '',
    password: ''
  }

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value })
  }

  handleLogIn = (e) => {
    const { email, password } = this.state
    this.props.userSignIn(email, password)
  }

  render() {
    return(
      <div>
        <form>
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
            <Link to='/serials_list' className='btn btn-secondary' onClick={this.handleLogIn}>Log in</Link>
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
