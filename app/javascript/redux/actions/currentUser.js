import axios from "axios";

export const getCurrentUser = () => {
  return(dispatch => {
    axios.get(`http://localhost:3000/user/sessions`)
      .then(res => { return dispatch(getCurrentUserSuccess(res.data.currentUser)) })
      .catch(err => { debugger })
  })
}

const getCurrentUserSuccess = (user) => ({ type: 'GET_CURRENT_USER_SUCCESS', payload: user })

export const userSignIn = (email, pass) => {
  return(dispatch => {
    axios.post(`http://localhost:3000/user/sessions`,
              {
                email: email,
                password: pass
              })
    .then(res => { dispatch(userSignedIn(res.data)) })
    .catch(err => { debugger })
  })
}

const userSignedIn = (user) => ({ type: 'USER_SIGNED_IN', payload: user })

export const userSignOut = () => {
  return(dispatch => {
    axios.delete(`http://localhost:3000/user/session`)
      .then(res => { return dispatch(userSignedOut(res.data.session)) })
      .catch(err => { debugger })
  })
}

const userSignedOut = (user) => ({ type: 'USER_SIGNED_OUT', payload: user })

export const authenticateUser = (newUser) => {
  return(dispatch => {
    axios.post(`http://localhost:3000/users/new`,
      {
        first_name: newUser.firstName,
        last_name: newUser.lastName,
        date_of_birth: newUser.dateOfBirth,
        gender: newUser.gender,
        country_id: newUser.countryId,
        email: newUser.email,
        password: newUser.password,
        password_confirmation: newUser.passwordConfirmation
      })
      .then(res => {
        dispatch(authenticateUserSuccess(res.data.user_id))
       })
      .catch(err => { dispatch(authenticateUserError(err)) })
  })
}

const authenticateUserSuccess = (res) => ({ type: 'AUTHENTICATE_USER_SUCCESS', payload: res })
const authenticateUserError = (err) => ({ type: 'AUTHENTICATE_USER_ERROR', payload: err })
