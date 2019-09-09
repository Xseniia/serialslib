import React, { Component } from 'react'
import { connect } from 'react-redux'

import { collectEpisodeData, fetchEpisodeComments, createComment } from '../../redux/actions/'

class EpisodeItem extends Component {
  state = {
    comment: ''
  }

  componentDidMount() {
    const { id } = this.props.match.params
    this.props.collectEpisodeData(id)
    this.props.fetchEpisodeComments(id)
  }

  handleCreateComment = (e) => {
    e.preventDefault()
    this.props.createComment(this.props.currentUser.id, this.props.match.params.id, null, this.state.comment, this.props.fetchEpisodeComments)

    this.setState({ comment: '' })
  }

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value })
  }

  render() {
    const { episode, episodeIndex, seasonIndex, serialTitle, comments, currentUser } = this.props

    return (
      <div classNameName="serial-container">
        <h5>{ serialTitle }</h5>
        <h4>Season: { seasonIndex }</h4>
        <h2>Episode: { episodeIndex }</h2>
        <p>Release date: { episode.release_date }</p>
        <br />
        <h4>What people think of this episode? </h4>
        <br />
        { comments.length > 0 ?
          comments.map(comment =>
            <div className="card card-body">
                <div className="card-user-info">
                  <div className="comment-user-email">
                    <h5 className="card-title">{ comment.user.email }</h5>
                  </div>
                  <div className="comment-button">

                  </div>
                </div>
                <p className="card-text">{ comment.content }</p>
                <p>
                  { comment.created_at }
                </p>
            </div>

          ) :
          'No comments yet.' }
          <br />
          <br />
          { currentUser ?
            <form onSubmit = { this.handleCreateComment }>
              <h5>Add a comment: </h5>
              <h6>{ currentUser.email }</h6>
              <textarea name="comment" value={this.state.comment} rows="3" className="form-control" id="create-comment-text-area" onChange={ this.handleChange }></textarea>
              <br />
              <button type="submit" className="btn btn-light">Comment</button>
            </form> : 'Only authorized users can create comments.'
          }

      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    episode: state.currentEpisode.episode,
    episodeIndex: state.currentEpisode.episodeIndex,
    seasonIndex: state.currentSeason.seasonIndex,
    serialTitle: state.currentEpisode.serialTitle,
    comments: state.currentEpisode.comments,
    currentUser: state.currentUser.user
  }
}

export default connect(mapStateToProps, { collectEpisodeData, fetchEpisodeComments, createComment })(EpisodeItem)
