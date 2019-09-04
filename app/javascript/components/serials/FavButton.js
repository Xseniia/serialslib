import React, { Component } from 'react'

class FavButton extends Component {
  render() {
    if(this.props.currentUser) {
      return(
        <div className="title-fav">
          {
            this.props.isFav ?
              <button name='remove' className='btn btn-light' onClick={this.props.handleFavourite}>Remove from favourites</button> :
              <button name='add' className='btn btn-light' onClick={this.props.handleFavourite}>Add to favourites</button>
          }
        </div>
      )
    } else return null
  }
}

export default FavButton
