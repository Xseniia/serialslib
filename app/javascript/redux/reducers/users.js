const initialState = {
  users: [],
  user: {
    id: null,
    email: null
  },
  userCountry: null
}

function UsersReducer(state=initialState, action) {
  switch(action.type) {
    case 'FETCH_USERS_SUCCESS':
      return { ...state, users: action.payload }
    case 'GET_USER_BY_ID_SUCCESS':
      return { ...state, user: action.payload, userCountry: action.country }
    default:
      return state;
  }
}

export default UsersReducer
