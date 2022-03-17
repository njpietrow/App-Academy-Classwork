import { connect } from "react-redux";
import BenchForm from "./bench_form";
import { createBench } from "../../actions/bench_actions";


const mSTP = (state) => ({
  bench: {
    description: "",
    lat: "",
    lng: "",
    seating: "",
  }
});

const mDTP = dispatch => ({
  createBench: (bench) => dispatch(createBench(bench))
})

export default connect(mSTP,mDTP)(BenchForm)

