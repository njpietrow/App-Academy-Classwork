import React from "react";
import BenchMap from "../map/bench_map";
import BenchIndex from "./bench_index";
import FilterForm from "./filter_form";

class Search extends React.Component{

  render(){
    const{benches, fetchBenches, updateFilter, minSeating, maxSeating} = this.props;
    return (
      <div>
        <BenchMap 
          benches={benches} 
          fetchBenches={fetchBenches} 
          updateFilter={updateFilter}
        />
        <FilterForm 
          minSeating={minSeating} 
          maxSeating={maxSeating} 
          updateFilter={updateFilter} 
        />
        <BenchIndex 
          benches={benches}
        />
      </div>
    )
  }
};

export default Search;