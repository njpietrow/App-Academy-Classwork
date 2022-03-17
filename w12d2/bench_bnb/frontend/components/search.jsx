import React from "react";
import BenchMap from "./bench_map";
import BenchIndex from "./bench_index";

class Search extends React.Component{
  render(){
    const{benches, fetchBenches} = this.props;
    console.log(this.props)
    return (
      <div>
        <BenchMap />
        <BenchIndex benches={benches} fetchBenches={fetchBenches} />
      </div>
    )
  }
};

export default Search;