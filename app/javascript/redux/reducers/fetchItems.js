const initialState = {
  tags: [],
  tagsFetched: false,
  genres: [],
  genresFetched: false,
  actors: [],
  actorsFetched: false,
  countries: [],
  countriesFetched: false
}

function FetchItemsReducer(state=initialState, action) {
  switch(action.type) {
    case 'FETCH_ITEMS_SUCCESS':
      return { ...state, [action.itemType]: action.payload, [action.itemType + 'Fetched']: true }
    default:
      return state;
  }
}

export default FetchItemsReducer
