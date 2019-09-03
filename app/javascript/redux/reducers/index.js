import { combineReducers } from 'redux'

import UsersReducer from './users'
import SerialsReducer from './serials'
import CurrentSerialReducer from './currentSerial'
import CurrentUserReducer from './currentUser'
import CurrentSeasonReducer from './currentSeason'
import CurrentEpisodeReducer from './currentSeason'
import FetchItemsReducer from './fetchItems'

const rootReducer = combineReducers({
  users: UsersReducer,
  serials: SerialsReducer,
  fetchedItems: FetchItemsReducer,
  currentSerial: CurrentSerialReducer,
  currentUser: CurrentUserReducer,
  currentSeason: CurrentSeasonReducer,
  currentEpisode: CurrentEpisodeReducer
})

export default rootReducer
