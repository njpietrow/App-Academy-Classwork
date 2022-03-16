import { RECEIVE_CURRENT_USER, RECEIVE_SESSION_ERRORS } from '../actions/session_actions';

const _nullSessionErrors = [];

const sessionErrorsReducer = (state=_nullSessionErrors, action) => {
  // console.log(action)
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_SESSION_ERRORS:
      return action.errors;
    case RECEIVE_CURRENT_USER:
      return _nullSessionErrors;
    default:
      return state;
  }
};

export default sessionErrorsReducer;