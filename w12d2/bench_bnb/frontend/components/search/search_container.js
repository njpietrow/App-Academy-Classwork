import { connect } from "react-redux";
import { fetchBenches } from "../../actions/bench_actions";
import { updateBounds } from "../../actions/filter_actions";
import { updateFilter } from "../../actions/filter_actions";
import Search from "./search"

const mSTP = state => ({
  benches: Object.values(state.entities.benches)
});

const mDTP = dispatch => ({
  // fetchBenches: (filters) => dispatch(fetchBenches(filters)),
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value)),
});

export default connect(mSTP, mDTP)(Search)