import React from "react";

class BenchForm extends React.Component{
  constructor(props){
    super(props);
    this.state = this.props.bench;
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field){
    return e => this.setState({[field]: e.currentTarget.value})
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.createBench(this.state)
  }

  render(){
    return(
      <form onSubmit={this.handleSubmit}>
        <label>Description:
          <input 
            type="text" 
            onChange={this.update("description")}
            value={this.state.description}
          />
        </label>
        <br />
        <label>Lattitude: 
          <input 
            type="text" 
            onChange={this.update("lat")}
            value={this.state.lat}
          />
        </label>
        <br />
        <label>Longitude:
          <input 
            type="text" 
            onChange={this.update("lng")}
            value={this.state.lng}
          />
        </label>
        <br />
        <label>Number of Seats:
          <input 
            type="text" 
            onChange={this.update("seating")}
            value={this.state.seating}
          />
        </label>
        <br />
        <input type="submit" value={"Add a Bench"} />
      </form>
    )
  }
}

export default BenchForm;