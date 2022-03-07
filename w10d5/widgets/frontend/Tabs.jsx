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
    const selIdx = this.state.selectedIndex;
    const content = this.props.tabs[selIdx].content
    

    const headers = this.props.tabs.map((tab,idx) => {
      return(
        <Header selIdx={selIdx} key={tab.title} title={tab.title} idx={idx} 
          setIdx={this.setIdx}
        />
      );
    });


    return(
      <div className="tab-wrapper">
        <h1>I Am Tabs</h1>
        <div className="tab-container">
          <ul className="headers">
            {headers}
          </ul>
          <div className="content-wrapper">
            <article>{content}</article>
          </div>
        </div>
      </div>
    )
  }
}

export default Tabs;