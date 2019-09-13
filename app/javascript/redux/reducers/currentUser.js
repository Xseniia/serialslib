const initialState = {
  user: {
    id: '',
    first_name: '',
    last_name: '',
    date_of_birth: '',
    gender: '',
    country_id: null,
    email: '',
    avatar: {
      url: '',
      thumb: {
        url: ''
      },
      large: {
        url: ''
      }
    }
  },
  registrationErrors: []
}

function CurrentUserReducer(state=initialState, action) {
  const initial = {
    id: '',
    first_name: '',
    last_name: '',
    date_of_birth: '',
    gender: '',
    country_id: null,
    email: '',
    avatar: {
      url: '',
      thumb: {
        url: ''
      },
      large: {
        url: ''
      }
    }
  }
  switch(action.type) {
    case 'GET_CURRENT_USER_SUCCESS':
      return { ...state, user: action.payload }
    case 'GET_CURRENT_USER_ERROR':
      return { ...state, user: initial }
    case 'USER_SIGNED_IN':
      return { ...state, user: action.payload }
    case 'USER_SIGNED_OUT':
      return { ...state, user: initial }
    case 'AUTHENTICATE_USER_SUCCESS':
      return { ...state, user: action.payload }
    case 'EDIT_USER_SUCCESS':
      return { ...state, user: action.payload }
    default:
      return { ...state };
  }
}

export default CurrentUserReducer
