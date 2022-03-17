export const UPDATE_FILTER = "UPDATE_FILTER";
import { fetchBenches } from "./bench_actions";

// export const updateBounds = (bounds) => {
//   return {
//     type: UPDATE_BOUNDS,
//     bounds
//   }
// }

const changeFilter = (filter, value) => {
  return {
    type: UPDATE_FILTER,
    filter,
    value
  }
}

export const updateFilter = (filter, value) => (dispatch, getState) => {
  dispatch(changeFilter(filter, value));
  return fetchBenches(getState().ui.filters)(dispatch);
};
