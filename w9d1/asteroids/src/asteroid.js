const MovingObject = require("./moving_object");
const Util = require("./utils.js");
const Ship = require("./ship.js")

const asteroidDefaults = {
  COLOR: '#D3D3D3',
  RADIUS: 20,
  LENGTH: 3
}

function Asteroid(options) {

  let args = {
    color: asteroidDefaults.COLOR,
    radius: asteroidDefaults.RADIUS,
    vel: Util.randomVec(asteroidDefaults.LENGTH),
    pos: options['pos'],
    game: options['game']
  }

  MovingObject.call(this, args)
}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate()
  }
}

module.exports = Asteroid;