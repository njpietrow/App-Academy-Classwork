import { RECEIVE_POKEMON } from "../actions/pokemon_actions";
import merge from 'lodash/merge';

const itemsReducer = (state ={}, action) => {
  Object.freeze(state);
  // let newState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_POKEMON:
      let newState = action.payload.items;
      return newState;
    default:
      return state;
  }
}

export default itemsReducer;