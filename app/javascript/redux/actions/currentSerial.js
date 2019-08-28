import axios from "axios";

export const collectSerialData = (serialId) => {
  return(dispatch => {
    axios.get(`http://localhost:3000/serials/${serialId}`)
      .then(response => {
        dispatch(collectSerialDataSuccess(response.data))
      })
      .catch(error => {
        debugger
      })
  })
}

const collectSerialDataSuccess = (serial) => ({ type: 'COLLECT_SERIAL_DATA_SUCCESS', payload: serial })

export const getSerialSeasons = (serialId) => {
  return(dispatch => {
    axios.get(`http://localhost:3000/seasons?serial_id=${serialId}`)
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
    axios.post(`http://localhost:3000/serials/${serialId}/add_${param_name}`, {
      payload: param_value
    })
    .then(res => { return refresher() })
    .catch(err => {
      debugger
    })
  )
}

export const deleteSerialParams = (serialId, param_name, param_id, refresher) => {
  return(
    axios.delete(`http://localhost:3000/serials/${serialId}/${param_name}`, { params: {
      payload: param_id
    }})
    .then(res => { return refresher() })
    .catch(err => { debugger })
  )
}