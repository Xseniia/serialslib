import axios from "axios";

const url = 'https://serialslib.herokuapp.com/'

export const collectEpisodeData = (episodeId) => {
  return(dispatch => {
    axios.get(`${url}episode/${episodeId}`)
      .then(res => { dispatch(collectEpisodeDataSuccess(res.data)) })
      .catch(err => { debugger })
  })
}

const collectEpisodeDataSuccess = (episodeData) => ({ type: 'COLLECT_EPISODE_DATA_SUCCESS', payload: episodeData })

export const fetchEpisodeComments = (episodeId) => {
  return(dispatch => {
    axios.get(`${url}episode/${episodeId}/comments`)
      .then(res => { dispatch(fetchEpisodeCommentsSuccess(res.data.comments)) })
      .catch(err => { debugger })
  })
}

const fetchEpisodeCommentsSuccess = (comments) => ({ type: 'FETCH_EPISODE_COMMENTS_SUCCESS', payload: comments })

export const createComment = (userId, episodeId, commentId, content, refreshComments) => {
  return(dispatch => {
    axios.post(`${url}episode/${episodeId}/create_comment`, {
      user_id: userId,
      comment_id: commentId,
      content: content
    })
    .then(res => { debugger; refreshComments(episodeId) })
    .catch(err => { debugger })
  })
}
