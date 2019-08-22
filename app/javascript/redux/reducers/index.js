import { combineReducers } from 'redux'

import UsersReducer from './users'
import SerialsReducer from './serials'

const rootReducer = combineReducers({
  users: UsersReducer,
  serials: SerialsReducer
})

export default rootReducer