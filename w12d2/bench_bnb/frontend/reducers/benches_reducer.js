import { RECEIVE_BENCHES, RECEIVE_BENCH } from "../actions/bench_actions";

const benchesReducer = (state = {}, action) => {
  Object.freeze(state);


  switch (action.type) {
    case RECEIVE_BENCHES:
      return action.benches;
    case RECEIVE_BENCH:
      const newState = {[action.bench.id]: action.bench};
      return Object.assign({}, state, newState);
    default:
      return state;
  }
};

export default benchesReducer;