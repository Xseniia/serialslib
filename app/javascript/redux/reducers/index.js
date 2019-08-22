import { combineReducers } from 'redux'

import users from './users'
import serials from './serials'

const rootReducer = combineReducers({
  users: users,
  serials: serials
})

export default rootReducer