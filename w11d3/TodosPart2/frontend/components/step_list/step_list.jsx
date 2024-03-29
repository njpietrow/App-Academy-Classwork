import React from 'react';
import StepListItemContainer from "./step_list_item_container"
// import TodoForm from '../todo_list/todo_form';
// import TodoListItem from './todo_list_item';

class StepList extends React.Component{
    constructor(props) {
        super(props);
    }

    render() {
        let {steps, receiveStep} = this.props;
        return (
          <div>
            <ul>
              {steps.map(step => <StepListItemContainer step={step} key={step.id} />)}
            </ul>
            {/* Render step form */}
          </div>
        )
    }
}

export default StepList;