const initialState = {
  serials: [],
  serialsFetched: false
}

function SerialsReducer(state=initialState, action) {
  switch(action.type) {
    case 'SEARCH_SERIALS_SUCCESS':
      return { ...state, serials: action.payload, serialsFetched: true }
    default:
      return state;
  }
}

export default SerialsReducer
