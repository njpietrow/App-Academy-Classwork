class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
    this.bindEvents();
  }

  setupBoard() {
    let ul = document.createElement("ul");

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let li = document.createElement("li");
        li.setAttribute("data-col", i);
        li.setAttribute("data-row", j)

        ul.appendChild(li);
      }
    }
    this.el.appendChild(ul);
  }
  
  bindEvents() {
    this.el.addEventListener('click', this.handleClick.bind(this))
  }

  handleClick(e) {
    e.preventDefault();
    let ele = e.target;
    // console.log("clicked ele")
    this.makeMove(ele)
  }

  makeMove(square) {
    // console.log("in Make move function")
    //call game.prototpe.playmove(pos)
    if (square.innerText !== "") {
      alert("That square is occupied");
      return;
    }
    square.classList.add("clicked");
    let mark = this.game.currentPlayer;
    square.innerText = mark;
    let row = square.getAttribute("data-row");
    let col = square.getAttribute("data-col");
    this.game.playMove([row, col]);
    // if (this.game.isOver()) {
    //   alert("GAME OVER!");
    // }
    if (this.game.isOver()) {
      // this.board.print();
      if (this.game.winner()) {
        alert(`${this.game.winner()} has won!`);
        this.markWinner(mark);
      } else {
        alert('NO ONE WINS!');
      }
    }

    
  }

  // if winner
    // grab array of all lis
    // iterate and add "winner" to class if they match
  markWinner(mark) {
    let squares = document.querySelectorAll("li");
    squares.forEach(square => {
      if (square.innerText === mark.toLowerCase()) {
        debugger
        square.classList.add("winner");
      } else {
        square.classList.add("loser");
      }
    })

  }

}

module.exports = View;
