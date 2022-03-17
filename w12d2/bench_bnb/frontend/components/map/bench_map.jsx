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