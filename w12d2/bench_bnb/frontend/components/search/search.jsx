import React from "react";
import BenchMap from "../map/bench_map";
import BenchIndex from "./bench_index";

class Search extends React.Component{

  render(){
    const{benches, fetchBenches} = this.props;
    console.log(this.props)
    return (
      <div>
        <BenchMap benches={benches} fetchBenches={fetchBenches} />
        <BenchIndex benches={benches}  />
      </div>
    )
  }
};

export default Search;