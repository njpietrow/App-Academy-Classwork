import { connect } from "react-redux";
import BenchForm from "./bench_form";
import { createBench } from "../../actions/bench_actions";


const mSTP = (state, ownProps) => {
  const {location} = ownProps;
  return {
    bench: {
      description: "",
      lat: new URLSearchParams(location.search).get("lat"),
      lng: new URLSearchParams(location.search).get("lng"),
      seating: 1,
    }
  }
};

const mDTP = dispatch => ({
  createBench: (bench) => dispatch(createBench(bench))
})

export default connect(mSTP,mDTP)(BenchForm)

