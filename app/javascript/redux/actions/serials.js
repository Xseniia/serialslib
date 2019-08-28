import axios from "axios";

export const fetchItems = (item_name) => {
  return(dispatch => {
    axios.get(`http://localhost:3000/${item_name}`)
      .then(response => {
        dispatch(fetchItemsSuccess(response.data.items, item_name))
      })
      .catch(error => {
        debugger
      })
  })
}

const fetchItemsSuccess = (items, item_name) => ({ type: 'FETCH_ITEMS_SUCCESS', itemType: item_name, payload: items });

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

