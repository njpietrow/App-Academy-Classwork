import ReactDOM from "react-dom";
import React from "react";
import Root from "./components/root"
import configureStore from "./store/store";

// for testing
// import { signUp, logIn, logOut} from './util/session_api_util'
import { login, logout, signup } from "./actions/session_actions";
// end testing

document.addEventListener("DOMContentLoaded", () => {
  let store;
  if (window.currentUser){
    const preloadedState = {
      entities: {
        users: {[window.currentUser.id]: window.currentUser}
      },
      session: {id: window.currentUser.id}
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  };
  
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);

  // TESTING START
  window.user = {username: "123", password: "password"}
  window.signup = signup;
  window.login = login;
  window.logout = logout;

  window.getBenches = () => $.ajax({ 
    method: "GET",
    url: "/api/benches/"
  });

  window.createBench = () => $.ajax({ 
    method: "POST",
    url: "/api/benches/",
    data: {
      bench: {
        description: "bench3",
        lat: 100,
        lng: 200
      }
    }
  });
  // window.store = store;
  window.getState = store.getState;
  window.dispatch = store.dispatch;  
  // TESTING END
});