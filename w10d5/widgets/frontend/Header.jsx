import React from "react";

class Header extends React.Component {
  constructor(props){
    super(props);

    this.updateIdx = this.updateIdx.bind(this);
  }

  updateIdx(){
    // debugger
    this.props.setIdx(this.props.idx)
  }

  render(){
    let {title, content} = this.props;
    return (
      <li key={title} onClick={this.updateIdx}>
        <h2>{title}</h2>
        <article>{content}</article>
      </li>
    )
  }
}

export default Header;