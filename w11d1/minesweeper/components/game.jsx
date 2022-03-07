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

  restartGame(){
    this.setState({ board: new Minesweeper.Board(9,10) })
  }

  render(){
    // const {board} = this.state;
    let result = "";
    if (this.state.board.won()) {
      result = 
        <div className="modal">
          <div className="modal-content">
            <p> You Won! Try again?</p>
            <button onClick={()=>this.restartGame()}>Restart</button>
          </div>
          <div className="modal-screen"></div>
        </div>
    }
    else if (this.state.board.lost()) {
      result =
        <div className="modal">
          <div className="modal-content">
            <p> You Lost! Try again?</p>
            <button onClick={()=>this.restartGame()}>Restart</button>
          </div>
          <div className="modal-screen"></div>
        </div>
    }

    return (
      <div className="board-container"> 
        <h1>Minesweeper</h1>
        <p>Click to explore a tile. <br /> Alt + click to flag a tile.</p>
        {result}
        <Board board={this.state.board} updateGame={this.updateGame}/>
      </div>
    )
  }

}

export default Game;

