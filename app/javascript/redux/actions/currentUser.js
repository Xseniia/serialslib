import axios from "axios";

export const getCurrentUser = () => {
  return(dispatch => {
    axios.get(`http://localhost:3000/user/sessions`)
      .then(res => { dispatch(userSignedIn(res.data.currentUser)) })
      .catch(err => { debugger })
  })
}

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
      .then(res => { dispatch(userSignedOut(res.data.session)) })
      .catch(err => { debugger })
  })
}

const userSignedOut = (user) => ({ type: 'USER_SIGNED_OUT', payload: user })
