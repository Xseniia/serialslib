import axios from "axios";

const url = 'http://localhost:3000/'

export const collectSerialData = (serialId, userId, refresher) => {
  return(dispatch => {
    axios.get(`${url}serials/${serialId}?user_id=${userId}`)
      .then(
        response => {
          dispatch(collectSerialDataSuccess(response.data));
          refresher ? refresher(response.data.serial) : null
      })
      .catch(error => {
        debugger
      })
  })
}

const collectSerialDataSuccess = (serial) => ({ type: 'COLLECT_SERIAL_DATA_SUCCESS', payload: serial })

export const getSerialSeasons = (serialId) => {
  return(dispatch => {
    axios.get(`${url}seasons?serial_id=${serialId}`)
    .then(res => {
      dispatch(getSerialSeasonsSuccess(res.data.seasons))
    })
    .catch(err => {
      debugger
    })
  })
}

const getSerialSeasonsSuccess = (seasons) => ({ type: 'GET_SERIAL_SEASONS_SUCCESS', payload: seasons })

export const setSerialParams = (serialId, param_name, param_value, refresher) => {
  return(
    axios.post(`${url}serials/${serialId}/add_${param_name}`, {
      payload: param_value
    })
    .then(res => { return refresher()})
    .catch(err => {
      debugger
    })
  )
}

export const deleteSerialParams = (serialId, param_name, param_id, refresher) => {
  return(
    axios.delete(`${url}serials/${serialId}/${param_name}`, { params: {
      payload: param_id
    }})
    .then(res => { return refresher() })
    .catch(err => { debugger })
  )
}

export const switchFavourite = (serialId, userId, action) => {
  return(dispatch => {
    axios.post(`${url}serials/${serialId}/${action}`, {
      user_id: userId
    })
    .then(res => {
      return dispatch(switchFavouriteSuccess(res.data.res))
    })
    .catch(err => {
      debugger
    })
  })
}

const switchFavouriteSuccess = (res) => ({ type: 'SWITCH_FAVOURITE_SUCCESS', payload: res })

export const changeUserRate = (serialId, userId, value, refreshSerialData) => {
  return(dispatch => {
    axios.post(`${url}serials/${serialId}/change_rate`, {
      user_id: userId,
      value: Number(value)
    })
    .then(res => { debugger; refreshSerialData(serialId, userId) })
    .catch(err => { debugger })
  })
}

export const changeViewStatus = (serialId, userId, status, refreshSerialData) => {
  return(dispatch => {
    axios.post(`${url}serials/${serialId}/update_view_status`, {
      user_id: userId,
      view_status: status
    })
    .then(res => { debugger; refreshSerialData(serialId, userId) })
    .catch(err => { debugger })
  })
}

export const updateSerial = (serialId, data) => {
  return(dispatch => {
    axios.patch(`${url}serials/${serialId}/edit`, data)
      .then(res => { debugger })
      .catch(err => { debugger })
  })

}
