import React from "react";
import BenchIndexItem from "./bench_index_item"

class BenchIndex extends React.Component{

  componentDidMount(){
    this.props.fetchBenches();
  }

  render(){
    const {benches} = this.props;
    return(
      <div>
        <ul>
          {
            benches.map( bench => (
              <BenchIndexItem bench={bench} key={bench.id} />
            ))
          }
        </ul>
      </div>
    )
  }
};

export default BenchIndex;