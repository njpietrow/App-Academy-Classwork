const MovingObject = require("./moving_object");
const Util = require("./utils.js");

const shipDefaults = {
  COLOR: '#FFA500',
  RADIUS: 12,
  VEL: [0,0]
}

function Ship(options){
  let args = {
    color: shipDefaults.COLOR,
    radius: shipDefaults.RADIUS,
    vel: shipDefaults.VEL,
    pos: options['pos'],
    game: options['game']
  }

  MovingObject.call(this, args)
}

Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition()
  this.vel = [0, 0]
}

module.exports = Ship;