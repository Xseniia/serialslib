import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'
import { collectSeasonData } from '../../redux/actions/'

class SeasonItem extends Component {
  componentDidMount = () => {
    const { id, serial_id } = this.props.match.params
    this.props.collectSeasonData(id)
  }

  render() {
    const { id, serial_id } = this.props.match.params
    const { episodes, seasonIndex, serialTitle } = this.props

    return(
      <div class="serial-container">
        <h4>{ serialTitle }</h4>
        <h2>Season { seasonIndex }</h2>
        <br/>
        <h3>Episodes:</h3>
      { episodes.map((episode, index) => <Link to={`/serials_list/${serial_id}/season/${id}/episode/${episode.id}`} className="list-item badge badge-light">Episode { index + 1 }</Link>) }
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return state.currentSeason
}

export default connect(mapStateToProps, { collectSeasonData })(SeasonItem)
