// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  var grid = [];
  for (var i = 0; i < 8; i++) {
    grid.push(Array(8));
  }
  let piece1 = new Piece('black');
  let piece2 = new Piece('black');
  let piece3 = new Piece('white');
  let piece4 = new Piece('white');

  grid[3][4] = piece1;
  grid[4][3] = piece2;
  grid[3][3] = piece3;
  grid[4][4] = piece4;
  
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0];
  let y = pos[1];

  if ((x>=0 && x<=7) && (y>=0 && y<=7)){
    return true;
  }
  return false;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x = pos[0];
  let y = pos[1];

  if (this.isValidPos(pos)){
    return this.grid[y][x];
  }
  throw new Error('Not valid pos!');
};

/**
 * Checks if the piece at a given position
 * matches a given color. 
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos) === undefined) {
    return false;
  }

  return (this.getPiece(pos).color === color);
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos) === undefined) {
    return false;
  }
  return true;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  // check if position on board -> return empty array if not
  // check if pos occupied -> return empty array if not
  // check if piece opposite color
    // if opp color, add pos to piecesToFlip, make recursive call in direction
    // if same color, return piecesToFlip

    if (!this.isValidPos(pos)) {
      return [];
    }
    let first = false;
    if (piecesToFlip === undefined) {
      let first = true;
      piecesToFlip = [];
    }
      if ((!this.isOccupied(pos)) && (!first)) {
        return [];
      }

      if ((this.isMine(pos, color)) && (!first)) {
        return piecesToFlip;
      }
      else {
        pos[0] += dir[0];
        pos[1] += dir[1];
        piecesToFlip.push(pos);
        // console.log(1);
        return this._positionsToFlip(pos, color, dir, piecesToFlip);
      }

    
    // return piecesToFlip;

    // let piece = this.getPiece(pos)
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE