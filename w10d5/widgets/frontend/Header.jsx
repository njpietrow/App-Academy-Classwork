import React from "react";

class Header extends React.Component {
  constructor(props){
    super(props);

    this.updateIdx = this.updateIdx.bind(this);
  }

  updateIdx(){
    this.props.setIdx(this.props.idx)
  }

  render(){
    let {title, selIdx, idx} = this.props;
    let active = "";
    (selIdx === idx) ? active = "active" : "";
    return (
      <span className={"header " + active} key={title} 
      onClick={this.updateIdx}>{title}</span>
    )
  }
}

export default Header;