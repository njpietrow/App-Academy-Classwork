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
        <nav>
            <div className="header-content">{`Welcome, ${currentUser.username}`}</div>
            <button onClick={()=>logout()}>Logout</button>
        </nav>
      )
    } else {
      return (
        <nav>
          <Link to="/signup" className="header-content">Sign up</Link>
          <Link to="/login" className="header-content">Login</Link>
        </nav>
      )
    }
  }
}

export default Greeting;