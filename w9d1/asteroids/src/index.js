const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");
const Asteroid = require("./asteroid.js")
const Game = require("./game.js")
const GameView = require("./game_view.js")
const Ship = require("./ship.js")

window.Game = Game;
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.GameView = GameView;
window.Ship = Ship;

window.addEventListener('DOMContentLoaded', () => {
  let canvas = document.getElementById('game-canvas');
  let ctx = canvas.getContext('2d');
  let gv = new GameView(ctx);
  window.game = gv
  gv.start();
});