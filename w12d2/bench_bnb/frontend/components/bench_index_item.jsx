import React from "react"

class BenchIndexItem extends React.Component{
  render(){
    const {bench} = this.props;
    return(
      <li>
        <span style={{ fontWeight: "bold" }} >{bench.description}</span>
        <p>Lat: {bench.lat}</p>
        <p>Lng: {bench.lng}</p>
      </li>
    )
  }
}

export default BenchIndexItem;