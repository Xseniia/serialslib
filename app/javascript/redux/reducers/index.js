import { combineReducers } from 'redux'

import UsersReducer from './users'
import SerialsReducer from './serials'
import currentSerial from './currentSerial'
import currentUser from './currentUser'

const rootReducer = combineReducers({
  users: UsersReducer,
  serials: SerialsReducer,
  currentSerial: currentSerial,
  currentUser: currentUser
})

export default rootReducer