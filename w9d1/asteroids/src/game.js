const Asteroid = require("./asteroid.js")

const gameDefaults = {
  DIM_X: 700,
  DIM_Y: 500,
  NUM_ASTEROIDS: 20
}

function Game() {
  this.asteroids = this.addAsteroids();
  this.ship = this.addShip();
}

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship])
}

Game.prototype.addShip = function() {
  return new Ship({
    pos: this.randomPosition(),
    game: this
  })
}

Game.prototype.addAsteroids = function() {
  const asteroids = []

  while (asteroids.length !== gameDefaults.NUM_ASTEROIDS) {
    asteroids.push(new Asteroid({
      pos: this.randomPosition(),
      game: this
    }))
  }

  return asteroids
}

Game.prototype.randomPosition = function() {
  let randX = Math.random() * gameDefaults.DIM_X;
  let randY = Math.random() * gameDefaults.DIM_Y;
  return [randX, randY];
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, gameDefaults.DIM_X, gameDefaults.DIM_Y);
  this.allObjects().forEach((ele) => {
    ele.draw(ctx);
  })
  // this.ship.draw(ctx)
}

Game.prototype.moveObjects = function(){
  this.allObjects().forEach((ele) => {
    ele.move();
  })
}

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];

  let magic_num = 20;

  if (x <= -magic_num) {
    x = gameDefaults.DIM_X;
  } else if (x>=gameDefaults.DIM_X + magic_num){
    x = 0;
  }

  if (y <= -magic_num) {
    y = gameDefaults.DIM_Y;
  } else if (y>= gameDefaults.DIM_Y + magic_num){
    y = 0;
  }

  return [x,y];
}

Game.prototype.checkCollisions = function() {
  
  this.allObjects().forEach((asteroid1, idx1) => {
    this.allObjects().forEach((asteroid2, idx2) => {
      if ((idx1 !== idx2) && (asteroid1.isCollidedWith(asteroid2))) {
        asteroid1.collideWith(asteroid2);
      }
    });
  });
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
  let idx = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(idx, 1);
}

module.exports = Game;