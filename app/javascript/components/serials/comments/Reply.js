import React, { Component } from 'react'
import { connect } from 'react-redux'

class Reply extends Component {
  render() {
    const { comments } = this.props
    const commentToReply = comments.find(comment => comment.id == this.props.commentId)
    console.log(commentToReply)

    return(
      <div>
        <p>Reply to {commentToReply.user.email}</p>
        <p>{commentToReply.content}</p>
      </div>
    )
  }
}

const mapstateToProps = (state) => {
  return { comments: state.currentEpisode.comments }
}

export default connect(mapstateToProps)(Reply)
