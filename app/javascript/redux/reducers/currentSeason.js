const initialState = {
  seasonIndex: null,
  serialTitle: '',
  episodes: []
}

function CurrentSeasonReducer(state=initialState, action) {
  switch (action.type) {
    case 'COLLECT_SEASON_DATA_SUCCESS':
      return { ...state, season: action.season, episodes: action.episodes, serialTitle: action.serialTitle, seasonIndex: action.seasonIndex }
    default:
      return state
  }
}

export default CurrentSeasonReducer
