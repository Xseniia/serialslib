import axios from "axios";

const url = 'http://localhost:3000/'

export const fetchItems = (item_name) => {
  return(dispatch => {
    axios.get(`${url}${item_name}`)
      .then(response => {
        dispatch(fetchItemsSuccess(response.data.items, item_name))
      })
      .catch(error => {
        debugger
      })
  })
}

const fetchItemsSuccess = (items, item_name) => ({ type: 'FETCH_ITEMS_SUCCESS', itemType: item_name, payload: items });
