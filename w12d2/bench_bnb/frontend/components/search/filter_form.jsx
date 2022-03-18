import React from "react";

class FilterForm extends React.Component{
  update(field){
    return e => this.props.updateFilter(field, parseInt(e.currentTarget.value))
  }

  render(){
    const{minSeating, maxSeating} = this.props;
    return(
      <form>
        <label>Minimum number of seats: 
          <input 
            type="number"
            value={minSeating} 
            onChange={this.update("minSeating")}   
          />
        </label>
        <br />
        <label>Maximum number of seats: 
          <input 
            type="number"
            value={maxSeating} 
            onChange={this.update("maxSeating")}   
          />
        </label>
        <br />
      </form>
    )
  }
}

export default FilterForm;