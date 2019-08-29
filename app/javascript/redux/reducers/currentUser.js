const initialState = {
  user : null
}

function CurrentUserReducer(state=initialState, action) {
  switch(action.type) {
    case 'USER_SIGNED_IN':
      return { ...state, user: action.payload }
    case 'USER_SIGNED_OUT':
      return { ...state, user: action.payload }
    default:
      return state;
  }
}

export default CurrentUserReducer
