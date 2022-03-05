import React from "react";

class Clock extends React.Component {
  constructor(props){
    super(props);
    this.state = { time: new Date() }
    this.tick = this.tick.bind(this);
  } 

  tick(){
    const time = new Date();
    this.setState({time})
  }

  componentDidMount(){
    this.timeInterval = setInterval(this.tick,1000)
  }

  componentWillUnmount(){
    clearInterval(this.timeInterval);
  }

  render(){
    const {time}  = this.state;
    const hours = time.getHours();
    const minutes = time.getMinutes();
    const seconds = time.getSeconds();
    const date = time.toDateString();

    return (
      <div className="clock-wrapper">
        <h1 className="title">I Am Clock</h1>
        <div className="clock">
          <div className="time-wrapper">
            <h2>Time: </h2>
            <h2>{ hours }:{ minutes }:{ seconds } PDT</h2>
          </div>
          <div className="date-wrapper">
            <h2>Date: </h2>
            <h2>{ date }</h2>
          </div>
        </div>
      </div>
        //TODO add date later
    );
  }
}

export default Clock;
