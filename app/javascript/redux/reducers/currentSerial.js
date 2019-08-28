const initialState = {
  serial: {
    country_id: null,
    description: '',
    id: null,
    image: {
      thumb: {
        url: ''
      }
    },
    title: '',
    year_of_premiere: null
  },
  seasons: [],
  tags: [],
  genres: [],
  actors: []
}

function CurrentSerialReducer(state=initialState, action) {
  switch(action.type) {
    case 'COLLECT_SERIAL_DATA_SUCCESS':
      return { ...state, serial: action.payload.serial, seasons: action.payload.seasons, tags: action.payload.tags, genres: action.payload.genres, actors: action.payload.actors }
    case 'GET_SERIAL_SEASONS_SUCCESS':
      return { ...state, seasons: action.payload }
    default:
      return state;
  }
}

export default CurrentSerialReducer