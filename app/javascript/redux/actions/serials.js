import axios from "axios";

export const searchSerial = (query='', tag='', genre='') => {
  return(dispatch => {
    axios.get(`http://localhost:3000/serials?query=${query}&&tag=${tag}&&genre=${genre}`)
      .then(response => {
        dispatch(searchSerialSuccess(response.data.items))
      })
      .catch(error => {
        debugger
      })
  })
}

const searchSerialSuccess = (queryResults) => ({ type: 'SEARCH_SERIALS_SUCCESS', payload: queryResults })
