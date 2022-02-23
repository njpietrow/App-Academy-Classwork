const View = require('./ttt-view.js');
const Game = require('./../ttt_node/game.js');

document.addEventListener("DOMContentLoaded", () => {
  const game1 = new Game();
  const ele = document.querySelector('.ttt');
  view1 = new View(game1, ele);
});


