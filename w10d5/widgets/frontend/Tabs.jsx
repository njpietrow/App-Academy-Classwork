import React from "react";
import Header from "./Header";

class Tabs extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      selectedIndex: 0
    }

    this.setIdx = this.setIdx.bind(this);
  }

  setIdx(idx){
    this.setState({selectedIndex: idx})
  }

  render(){
    const tabs = this.props.tabs.map((tab,idx) => {
      return(
        <Header key={tab.title} title={tab.title} 
          content={tab.content} idx={idx} 
          setIdx={this.setIdx}
        />
      );
    });

    return(
      <div className="tab-container">
        <h1>Tabs</h1>
        <p>Selected: {this.state.selectedIndex}</p>
        <ul className="tabs">
          {tabs}
        </ul>
      </div>
    )
  }
}

export default Tabs;