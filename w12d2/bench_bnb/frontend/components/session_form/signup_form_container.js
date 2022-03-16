import { connect } from "react-redux";
import SessionForm from "./session_form";
import { signup, clearSessionErrors } from "../../actions/session_actions";

const mSTP = (state) => {
  return {
    errors: state.errors.session,
    formType: "signup"  
  }
};

const mDTP = dispatch => ({
  processForm: (user) => dispatch(signup(user)),
  clearSessionErrors: () => dispatch(clearSessionErrors()),
})

export default connect(mSTP, mDTP)(SessionForm);