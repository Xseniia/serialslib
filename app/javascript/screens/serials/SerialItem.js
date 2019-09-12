import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'

import { collectSerialData,
         fetchItems,
         setSerialParams,
         deleteSerialParams,
         switchFavourite,
         changeUserRate,
         changeViewStatus } from '../../redux/actions/'

import FavButton from '../../components/serials/FavButton'

class SerialItem extends Component {
  state = {
    genre_id: '',
    tag_name: '',
    actor_id: '',
    viewStatus: ''
  }

  componentDidMount = () => {
    const serialId = this.props.match.params.id;

    this.props.collectSerialData(serialId, this.props.currentUser);
    if(this.props.genresFetched === false) this.props.fetchItems('genres');
    if(this.props.actorsFetched === false) this.props.fetchItems('actors')
  }

  handleSetSerialParams = (e) => {
    e.preventDefault();
    let value = null
    switch(e.target.name) {
      case 'genre':
        value = this.state.genre_id
        break
      case 'tag':
        value = this.state.tag_name
        break
      case 'actor':
        value = this.state.actor_id
        break
    };

    this.props.setSerialParams(this.props.match.params.id, e.target.name, value, this.componentDidMount);
    this.setState({
      genre_id: '',
      tag_name: '',
      actor_id: ''
     })
  }

  handleDeleleSerialParam = (e) => {
    this.props.deleteSerialParams(this.props.match.params.id, e.target.getAttribute('name'), e.target.getAttribute('value'), this.componentDidMount)
  }

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value })
  }

  handleFavourite = (e) => {
    switch(e.target.name) {
      case 'add':
        this.props.switchFavourite(this.props.serial.serial.id, this.props.currentUser, 'add_to_favourite');
        break;
      case 'remove':
        this.props.switchFavourite(this.props.serial.serial.id, this.props.currentUser, 'remove_from_favourite');
        break;
      default:
        return
    }
  }

  handleChangeRate = (e) => {
    const ratingStars = document.querySelectorAll('.rating-star')
    const currentStar = e.target;

    ratingStars.forEach(star => {
      if (star.id <= currentStar.id) {
        star.classList.remove('far');
        star.classList.add('fas')
      } else if (star.id > currentStar.id) {
        star.classList.add('far');
        star.classList.remove('fas');
      }
    })

    this.props.changeUserRate(this.props.serial.serial.id, this.props.currentUser, currentStar.id, this.props.collectSerialData)
  }

  handleChangeStatus = (e) => {
    this.handleChange(e)
    this.props.changeViewStatus(this.props.serial.serial.id, this.props.currentUser, e.target.value, this.props.collectSerialData)
  }

  render() {
    const { serial, seasons, tags, genres, actors } = this.props.serial,
          genreList = this.props.genres,
          actorsList = this.props.actors,
          { currentUser, overallRating, userRating, viewStatus } = this.props;

    const overallFilledStars = [];
    for (let i = 0; i < overallRating; i++) {
      overallFilledStars.push(<span><i className='fas fa-star' ></i></span>)
    }

    const overallEmptyStars = [];
    for (let i = overallRating; i < 5 ; i++) {
      overallEmptyStars.push(<span><i className='far fa-star' ></i></span>)
    }

    const userFilledStars = [];
    for (let i = 0; i < userRating; i++) {
      userFilledStars.push(
        <span><i className='fas fa-star rating-star' id={i + 1} onClick={this.handleChangeRate} ></i></span>
      )
    }

    const userEmptyStars = [];
    for (let i = userRating; i < 5; i++) {
      userEmptyStars.push(
        <span><i className='far fa-star rating-star' id={i + 1} onClick={this.handleChangeRate} ></i></span>
      )
    }

    return(
      <div className="serial-container">
        <div className="serial-img-description-container">
          <div className="serial-preview">
            <img src={serial.image.thumb.url} className="card-img-top" />
          </div>

          <div className="serial-body">
            <div className='title-block'>
              <h2 className="display-5">{serial.title}</h2>
            <FavButton currentUser={currentUser} isFav={this.props.isFav} handleFavourite={this.handleFavourite} />
            </div>

            <p>
              <strong>Year of premiere: </strong>
              {serial.year_of_premiere}
            </p>

            <p>
              <strong>Country of origin: </strong>
              {serial.country_of_origin}
            </p>

            <p>{serial.description}</p>

            <div className='serial-info'>
              <div className='main-info info-div'>
                <p className='serial-info-header'>Genres</p>
                { genres.length!=0 ?
                  genres.map(genre => <p key={genre.id} className='badge badge-light'>{ genre.title } <i name='delete_genre' value={genre.id} className="fas fa-times" onClick={this.handleDeleleSerialParam}></i></p>) :
                  <p className='no-info'>No genres</p> }

                <form className='form-row'
                      name='genre'
                      onSubmit={ this.handleSetSerialParams }>
                  <select name='genre_id'
                          id='genre_select'
                          className='user-dropdown'
                          value={this.state.genre_id}
                          onChange={this.handleChange}>
                    <option value='' disabled selected>Select genre</option>
                    { genreList.map(genre => <option value={ genre.id }>{ genre.title }</option>) }
                  </select>
                  <button type='submit'
                          className="btn btn-light user-button">Add</button>
                  <br/>
                </form>

                <p className='serial-info-header'>Tags</p>
                { tags.length!=0 ?
                  tags.map(tag => <p className='badge badge-light'>{ tag.tag_name } <i name='delete_tag' value={ tag.id } className="fas fa-times" onClick={this.handleDeleleSerialParam}></i></p>) :
                  <p className='no-info'>No tags</p> }

                <form name='tag'
                      className='form-row'
                      onSubmit={ this.handleSetSerialParams }>
                  <input type='text'
                         name='tag_name'
                         className='user-dropdown'
                         id='tag_select'
                         placeholder='ex: superheroes'
                         value={this.state.tag_name}
                         onChange={this.handleChange} />
                  <button type='submit'
                          className="btn btn-light user-button">Add</button>
                  <br/>
                </form>

                <p className='serial-info-header'>Actors</p>
                { actors.length!=0 ?
                  actors.map(actor => <p className='badge badge-light'>{ actor.first_name } { actor.last_name } <i name='delete_actor' value={ actor.id } className="fas fa-times" onClick={this.handleDeleleSerialParam}></i></p>) :
                  <p className='no-info'>No actors</p> }

                <form className='form-row'
                      name='actor'
                      onSubmit={this.handleSetSerialParams}>
                  <select name='actor_id'
                          id='actor_select'
                          className='user-dropdown'
                          value={this.state.actor_id}
                          onChange={this.handleChange}>
                    <option value='' disabled selected>Select actor</option>
                    { actorsList.map(actor => <option value={ actor.id }>{ actor.first_name } { actor.last_name }</option>) }
                  </select>
                  <button type='submit'
                          className="btn btn-light user-button">Add</button>
                  <br/>
                </form>

                </div>

                <div className="serial-rating-status info-div">
                  <div className='rating'>
                    <p>Overall rating </p>

                  { overallFilledStars}{ overallEmptyStars }

                  </div>

                  { currentUser ?
                    <div className='rating'>
                      <p>My rating </p>

                    { userFilledStars }{ userEmptyStars }

                    </div> : null
                  }

                  <div className="status">
                    { currentUser ?
                      <p>
                        View status:
                        <span>
                          { viewStatus ?
                            viewStatus :
                            'You didn\'t mention your view status on this serial yet.'
                          }
                        </span>
                        <select name='viewStatus' value={this.state.viewStatus} onChange={this.handleChangeStatus}>
                          <option value="" disabled>Select view status</option>
                          <option value="Will be watching">Will be watching</option>
                          <option value="Watching right now">Watching right now</option>
                          <option value="Finished watching">Finished watching</option>
                          <option value=''>none</option>
                        </select>
                      </p> : null
                    }
                  </div>
              </div>
            </div>
          </div>
        </div>

        <hr className="my-4"/>
        <h3>Seasons:</h3>
          { seasons.map((season, index) =>
            <Link
              to={`/serials_list/${serial.id}/season/${season.id}`}
               className="list-item badge badge-light">Season {index + 1}</Link>) }
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  const currUserId = state.currentUser.user != null ? state.currentUser.user.id : null

  return {
    serial: state.currentSerial,
    genres: state.fetchedItems.genres,
    genresFetched: state.fetchedItems.genresFetched,
    actors: state.fetchedItems.actors,
    actorsFetched: state.fetchedItems.actorsFetched,
    currentUser: currUserId,
    isFav: state.currentSerial.isFav,
    overallRating: state.currentSerial.overallRating,
    userRating: state.currentSerial.userRating,
    viewStatus: state.currentSerial.viewStatus,
    }
}

export default connect(mapStateToProps, { collectSerialData, fetchItems, setSerialParams, deleteSerialParams, switchFavourite, changeUserRate, changeViewStatus })(SerialItem)
