import React from "react";

class BenchMap extends React.Component{
  componentDidMount() {
    // set the map to show SF
    const mapOptions = {
      center: { lat: 34.053064, lng: -118.427533 }, // this is LA
      zoom: 13
    };

    // wrap this.mapNode in a Google Map
    // this.map = new google.maps.Map(this.mapNode, mapOptions);
  }
  render(){
    return (
      <div ref='map' id='map-container'>

      </div>
    )
  }
}

export default BenchMap;