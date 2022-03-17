import React from "react";
import MarkerManager from "../../util/marker_manager";
import { withRouter } from "react-router-dom";

class BenchMap extends React.Component{

  constructor(props){
    super(props)
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(coords){
    this.props.history.push({
      pathname: "benches/new",
      search: `lat=${coords.lat}&lng=${coords.lng}`
    });
  }

  //LIFECYCLE METHODs
  componentDidMount() {
    
    // set the map to show West LA
    const mapOptions = {
      center: { lat: 34.043064, lng: -118.43649 }, // this is LA
      zoom: 13
    };
    
    // wrap this.mapNode in a Google Map
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    
    //add listener to update map bounds when stop moving
    this.map.addListener("idle", (e) => {
      const latLngBounds = this.map.getBounds();
      const northEast = latLngBounds.getNorthEast();
      const southWest = latLngBounds.getSouthWest();
      const bounds = {
        northEast: {
          lat: northEast.lat(), 
          lng: northEast.lng()
          },
        southWest: {
          lat: southWest.lat(), 
          lng: southWest.lng()
        }
      }
      this.props.updateFilter("bounds", bounds);
    })

    //add listener to send coordinates in query parameter when clicking on map.
    this.map.addListener("click", (mapsMouseEvent) => {
      const latLng = mapsMouseEvent.latLng
      const coords = {lat: latLng.lat(), lng: latLng.lng()}
      this.handleClick(coords);
    });

    //create new MarkerManager instance. update Markers upon mounting
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);
  }

  componentDidUpdate(){
    //update Markers everytime the benches update
    this.MarkerManager.updateMarkers(this.props.benches);
  }

  render(){
    return (
      <div ref={ map => this.mapNode = map } id='map-container'>

      </div>
    )
  }
}

export default withRouter(BenchMap);