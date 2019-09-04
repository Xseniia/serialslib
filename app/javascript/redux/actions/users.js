import axios from "axios";

export const fetchUsers = () => {
  return(dispatch => {
    axios.get(`http://localhost:3000/users`)
      .then(res => { return dispatch(fetchUsersSuccess(res.data.users)) })
      .catch(err => { debugger })
  })
}

const fetchUsersSuccess = (users) => ({ type: 'FETCH_USERS_SUCCESS', payload: users })

export const getUserById = (id) => {
  return(dispatch => {
    axios.get(`http://localhost:3000/users/${id}`)
      .then(res => { return dispatch(getUserByIdSuccess(res.data)) })
      .catch(err => { debugger })
  })
}

const getUserByIdSuccess = (userData) => ({ type: 'GET_USER_BY_ID_SUCCESS', payload: userData.user, country: userData.country, favourites: userData.favourites })
