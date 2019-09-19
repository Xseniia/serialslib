import axios from "axios";

const url = 'http://localhost:3000/'

export const fetchUsers = () => {
  return(dispatch => {
    axios.get(`${url}user/all`)
      .then(res => { return dispatch(fetchUsersSuccess(res.data.users)) })
      .catch(err => { debugger })
  })
}

const fetchUsersSuccess = (users) => ({ type: 'FETCH_USERS_SUCCESS', payload: users })

export const getUserById = (id) => {
  return(dispatch => {
    axios.get(`${url}user/${id}`)
      .then(res => { return dispatch(getUserByIdSuccess(res.data)) })
      .catch(err => { debugger })
  })
}

const getUserByIdSuccess = (userData) => ({ type: 'GET_USER_BY_ID_SUCCESS', payload: userData.user, country: userData.country, favourites: userData.favourites })

export const deleteUser = (userId, refresher) => {
  return (dispatch => {
    axios.delete(`${url}user/${userId}/delete`)
      .then(res => { return refresher() })
      .catch(err => { debugger })
  })
}

export const fetchSerialsByStatus = (userId, status) => {
  return (dispatch => {
    axios.get(`${url}user/${userId}/serials_by_status`, { params: {
      status: status
    }})
    .then(res => { dispatch(fetchSerialsByStatusSuccess(res.data)) })
    .catch(err => { debugger })
  })
}

const fetchSerialsByStatusSuccess = (fetched) => ({ type: 'FETCH_SERIALS_BY_STATUS_SUCCESS', payload: fetched.serials })
