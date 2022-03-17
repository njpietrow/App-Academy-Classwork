import React from "react";
import BenchMap from "../map/bench_map";
import BenchIndex from "./bench_index";

class Search extends React.Component{

  render(){
    const{benches, fetchBenches, updateBounds} = this.props;
    return (
      <div>
        <BenchMap 
          benches={benches} 
          fetchBenches={fetchBenches} 
          updateBounds={updateBounds}
        />
        <BenchIndex benches={benches}  />
      </div>
    )
  }
};

export default Search;