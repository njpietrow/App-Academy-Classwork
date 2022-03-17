class MarkerManager{
  constructor(map){
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches){
    //for each bench, if the id is not in this.markers, create a new marker 
    //add it to the map and add it to this.markers
    console.log("time to udpate");

    benches.forEach(bench => {
      if(!this.markers[bench.id]){
        this.createMarkerFromBench(bench)
      }
    });
  }

  createMarkerFromBench(bench){
    //adds a marker to the map and to the markers object
    const Latlng = new google.maps.LatLng(parseFloat(bench.lat),parseFloat(bench.lng));

    //create a new marker
    var marker = new google.maps.Marker({
      position: Latlng,
      title: bench.description
    });

    //add the marker to the map and the the markers object
    marker.setMap(this.map);
    this.markers[bench.id] = marker;
  }

};

export default MarkerManager;