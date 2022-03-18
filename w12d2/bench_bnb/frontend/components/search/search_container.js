import { connect } from "react-redux";
import { updateFilter } from "../../actions/filter_actions";
import Search from "./search"

const mSTP = state => ({
  benches: Object.values(state.entities.benches),
  minSeating: state.ui.filters.minSeating,
  maxSeating: state.ui.filters.maxSeating,
});

const mDTP = dispatch => ({
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value)),
});

export default connect(mSTP, mDTP)(Search)