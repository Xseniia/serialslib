import React, { Component } from 'react'
import { connect } from 'react-redux'

class Reply extends Component {
  render() {
    const { comments } = this.props
    const commentToReply = comments.find(comment => comment.id == this.props.commentId)

    return(
      <div className="card card-body">
        <p>Reply to <strong>{commentToReply.user.email}</strong></p>
        <p>{commentToReply.content}</p>
      </div>
    )
  }
}

const mapstateToProps = (state) => {
  return { comments: state.currentEpisode.comments }
}

export default connect(mapstateToProps)(Reply)
