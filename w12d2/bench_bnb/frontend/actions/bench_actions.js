import * as BenchAPIUtil from "../util/bench_api_util"
import { updateFilter, UPDATE_FILTER } from "./filter_actions";

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";


export const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches
})

export const receiveBench = (bench) => {
  return {
    type: RECEIVE_BENCH,
    bench
  }
}

// export const updateFilter = (filter, value) => {
//   return {
//     type: UPDATE_FILTER,
//     filter,
//     value
//   }
// }

export const fetchBenches = (filters) => dispatch => {
  return BenchAPIUtil.fetchBenches(filters)
    .then(benches => dispatch(receiveBenches(benches)))
}

export const createBench = (bench) => dispatch => {
  return BenchAPIUtil.createBench(bench)
    .then(bench => dispatch(receiveBench(bench)))
}

