const initialState = {
  tags: [],
  tagsFetched: false,
  genres: [],
  genresFetched: false,
  serials: [],
  serialsFetched: false
}

function SerialsReducer(state=initialState, action) {
  switch(action.type) {
    case 'FETCH_ITEMS_SUCCESS':
      return { ...state, [action.itemType]: action.payload, [action.itemType + 'Fetched']: true }
    case 'SEARCH_SERIALS_SUCCESS':
      return { ...state, serials: action.payload }
    default:
      return state;
  }
}

export default SerialsReducer