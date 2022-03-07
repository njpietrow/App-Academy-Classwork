import React from "react"
import * as Minesweeper from "./../minesweeper"

class Game extends React.Component{
  constructor(props){
    super(props);
    this.state = {board: new Minesweeper.Board(9,10)};
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(){

  }

  render(){
    const board = this.state.board;
    return (
      // <div> hello </div>
      <Board board={board} updateGame={this.updateGame}/>
    )
  }

}

export default Game;

