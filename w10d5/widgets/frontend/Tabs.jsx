import React from "react";

class Tabs extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      selectedIndex: 0
    }
  }

  render(){
    const tabs = this.props.tabs.map(tab => {
      return(
        <h1></h1>
      )
    });

    return(
      <div>
        <h1>Tabs</h1>
        <ul>
          {tabs}
        </ul>
      </div>
    )
  }
}

export default Tabs;