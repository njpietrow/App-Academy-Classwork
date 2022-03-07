import React from "react"
import * as Minesweeper from "./../minesweeper"
import Board from "./board"

class Game extends React.Component{
  constructor(props){
    super(props);
    this.state = {board: new Minesweeper.Board(9,10)};
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, revealing){
    if (revealing) {
      tile.explore()
    }
    else {
      tile.toggleFlag()
    }
    this.setState({ board: this.state.board })
  }

  render(){
    // const {board} = this.state;
    let result = "";
    if (this.state.board.won()) {
      result = "Congrats!"
    }
    else if (this.state.board.lost()) {
      result = "You lost!"
    }

    return (
      <div> 
        {result}
        <Board board={this.state.board} updateGame={this.updateGame}/>
      </div>
    )
  }

}

export default Game;

