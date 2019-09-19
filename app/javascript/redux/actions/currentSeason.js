import axios from "axios";

const url = 'https://serialslib.herokuapp.com/'

export const collectSeasonData = (id) => {
  return(dispatch => {
    axios.get(`${url}season/${id}`)
      .then(res => { return dispatch(collectSeasonDataSuccess(res.data)) })
      .catch(err => { debugger })
  })
}

const collectSeasonDataSuccess = (data) => ({ type: 'COLLECT_SEASON_DATA_SUCCESS', episodes: data.episodes, serialTitle: data.serialTitle, seasonIndex: data.seasonIndex })
