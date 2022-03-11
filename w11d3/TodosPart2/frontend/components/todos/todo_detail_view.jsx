import React from "react";
import StepListContainer from '../step_list/step_list_container'

class TodoDetailView extends React.Component {
  constructor(props){
    super(props);
    // console.log(props)
  }

  render(){
    let {todo, removeTodo} = this.props;
    let {body, done} = todo;
    return (
      <div>
        Body: {body}, Status: {done ? "Done" : "Not Done"}
        <br />
        <button onClick={()=>removeTodo(todo)}> Delete </button>
        <StepListContainer todo_id={todo.id} />
      </div>
    )
  }
}

export default TodoDetailView;

// , Body: {todo.body}, Status: {status(todo.done)}
