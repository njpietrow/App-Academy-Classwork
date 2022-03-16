import React from "react";
import { Link } from "react-router-dom";

class Greeting extends React.Component{
  constructor(props){
    super(props)
  }

  render(){
    const {currentUser, logout} = this.props;

    if (currentUser) {
      return (
        <div>
          <span>{`Welcome, ${currentUser.username}`}</span>
          <button onClick={()=>logout()}>Logout</button>
        </div>
      )
    } else {
      return (
        <div>
          <Link to="/signup">Sign up</Link>
          <Link to="/login">Login</Link>
        </div>
      )
    }
  }
}

export default Greeting;