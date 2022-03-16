import React from "react";
import { Link } from "react-router-dom";

class SessionForm extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount(){
    this.unlisten = this.props.history.listen(() => {
      this.props.clearSessionErrors();
    });
  }

  componentWillUnmount() {
    this.unlisten();
  }

  handleSubmit(e){
    e.preventDefault()
    const user = Object.assign({}, this.state);
    this.props.processForm(user)
  }

  update(field){
    return e => this.setState({[field]: e.currentTarget.value})
  }

  renderErrors(){
    const {errors} = this.props
    if(!errors) return null;
    return(
      <ul>
        {errors.map((error,idx) => (
          <li key={idx}>
            {error}
          </li>
        ))}
      </ul>
    )
  }

  render(){
    const {formType} = this.props
    const signup = (formType === "signup");

    return(
      <div>
        <header>
          <h2>
            {signup ? "Sign up" : "Log in"}
          </h2>
          <Link to={signup ? "/login" : "/signup"}>{signup ? "Log in" : "Sign up"}</Link>
        </header>
        {this.renderErrors()}
        <form onSubmit={this.handleSubmit}>
          <label>Username:
            <input 
              type="text" 
              onChange={this.update("username")}
              value={this.state.username}
            />
          </label>
          <br />
          <label>Password:
            <input 
              type="password" 
              onChange={this.update("password")}
              value={this.state.password}
            />
          </label>
          <br />
          <input type="submit" value={formType}/>
        </form>
      </div>
    )
  }
}

export default SessionForm;