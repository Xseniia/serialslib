const initialState = {
  episode: {
    release_date: null
  },
  episodeIndex: null,
  seasonIndex: null,
  serialTitle: null,
  comments: []
}

function CurrentEpisodeReducer(state=initialState, action) {
  switch(action.type) {
    case 'COLLECT_EPISODE_DATA_SUCCESS':
      return { ...state,
          episode: action.payload.episode,
          episodeIndex: action.payload.episodeIndex,
          seasonIndex: action.payload.seasonIndex,
          serialTitle:  action.payload.serialTitle
        }
      case 'FETCH_EPISODE_COMMENTS_SUCCESS':
        return { ...state, comments: action.payload }
    default:
      return state;
  }
}

export default CurrentEpisodeReducer
