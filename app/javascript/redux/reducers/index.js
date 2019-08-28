import { combineReducers } from 'redux'

import UsersReducer from './users'
import SerialsReducer from './serials'
import currentSerial from './currentSerial'

const rootReducer = combineReducers({
  users: UsersReducer,
  serials: SerialsReducer,
  currentSerial: currentSerial
})

export default rootReducer