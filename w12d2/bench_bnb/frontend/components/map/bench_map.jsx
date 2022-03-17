import React from "react";
import MarkerManager from "../../util/marker_manager";

class BenchMap extends React.Component{

  componentDidMount() {
    
    // set the map to show West LA
    const mapOptions = {
      center: { lat: 34.043064, lng: -118.43649 }, // this is LA
      zoom: 13
    };
    
    // wrap this.mapNode in a Google Map
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    
    this.unlisten = this.map.addListener("idle", (e) => {
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
      //TODO: add testing for limiting benches in markers, state, and map to be only in bounds.
    })

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

export default BenchMap;