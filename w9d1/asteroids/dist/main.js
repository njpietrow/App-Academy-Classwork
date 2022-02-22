/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nconst asteroidDefaults = {\n  COLOR: '#D3D3D3',\n  RADIUS: 20,\n  LENGTH: 3\n}\n\nfunction Asteroid(options) {\n\n  let args = {\n    color: asteroidDefaults.COLOR,\n    radius: asteroidDefaults.RADIUS,\n    vel: Util.randomVec(asteroidDefaults.LENGTH),\n    pos: options['pos'],\n    game: options['game']\n  }\n\n  MovingObject.call(this, args)\n}\n\nAsteroid.prototype.collideWith = function(otherObject) {\n  if (otherObject instanceof Ship) {\n    otherObject.relocate()\n  }\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\n\nconst gameDefaults = {\n  DIM_X: 700,\n  DIM_Y: 500,\n  NUM_ASTEROIDS: 20\n}\n\nfunction Game() {\n  this.asteroids = this.addAsteroids();\n  this.ship = this.addShip();\n}\n\nGame.prototype.allObjects = function() {\n  return this.asteroids.concat([this.ship])\n}\n\nGame.prototype.addShip = function() {\n  return new Ship({\n    pos: this.randomPosition(),\n    game: this\n  })\n}\n\nGame.prototype.addAsteroids = function() {\n  const asteroids = []\n\n  while (asteroids.length !== gameDefaults.NUM_ASTEROIDS) {\n    asteroids.push(new Asteroid({\n      pos: this.randomPosition(),\n      game: this\n    }))\n  }\n\n  return asteroids\n}\n\nGame.prototype.randomPosition = function() {\n  let randX = Math.random() * gameDefaults.DIM_X;\n  let randY = Math.random() * gameDefaults.DIM_Y;\n  return [randX, randY];\n}\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, gameDefaults.DIM_X, gameDefaults.DIM_Y);\n\n  this.allObjects().forEach((ele) => {\n    ele.draw(ctx);\n  })\n  // this.ship.draw(ctx)\n}\n\nGame.prototype.moveObjects = function(){\n  this.allObjects().forEach((ele) => {\n    ele.move();\n  })\n}\n\nGame.prototype.wrap = function(pos) {\n  let x = pos[0];\n  let y = pos[1];\n\n  let magic_num = 20;\n\n  if (x <= -magic_num) {\n    x = gameDefaults.DIM_X;\n  } else if (x>=gameDefaults.DIM_X + magic_num){\n    x = 0;\n  }\n\n  if (y <= -magic_num) {\n    y = gameDefaults.DIM_Y;\n  } else if (y>= gameDefaults.DIM_Y + magic_num){\n    y = 0;\n  }\n\n  return [x,y];\n}\n\nGame.prototype.checkCollisions = function() {\n  \n  this.allObjects().forEach((asteroid1, idx1) => {\n    this.allObjects().forEach((asteroid2, idx2) => {\n      if ((idx1 !== idx2) && (asteroid1.isCollidedWith(asteroid2))) {\n        asteroid1.collideWith(asteroid2);\n      }\n    });\n  });\n};\n\nGame.prototype.step = function() {\n  this.moveObjects();\n  this.checkCollisions();\n}\n\nGame.prototype.remove = function(asteroid) {\n  let idx = this.asteroids.indexOf(asteroid);\n  this.asteroids.splice(idx, 1);\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(ctx){\n  this.ctx = ctx;\n  this.game = new Game();\n}\n\nGameView.prototype.start = function() {\n  setInterval(() => {\n    this.game.step();\n    this.game.draw(this.ctx);\n  },20);\n}\n\n\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\n\nwindow.Game = Game;\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.GameView = GameView;\nwindow.Ship = Ship;\n\nwindow.addEventListener('DOMContentLoaded', () => {\n  let canvas = document.getElementById('game-canvas');\n  let ctx = canvas.getContext('2d');\n  let gv = new GameView(ctx);\n  window.game = gv\n  gv.start();\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction MovingObject(args){\n  this.pos = args['pos'];\n  this.vel = args['vel'];\n  this.radius = args['radius'];\n  this.color = args['color'];\n  this.game = args['game'];\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI, false);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function() {\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  this.pos = this.game.wrap(this.pos);\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  let totalDistance = Util.distance(this.pos, otherObject.pos)\n  return (totalDistance < (this.radius + otherObject.radius))\n}\n\nMovingObject.prototype.collideWith = function(otherObject) {\n  // this.game.remove(this);\n  // this.game.remove(otherObject);\n}\n\nmodule.exports = MovingObject;\n\n// const mo = new MovingObject({\n//   pos: [30, 30],\n//   vel: [10, 10],\n//   radius: 5,\n//   color: \"#00FF00\"\n// });\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nconst shipDefaults = {\n  COLOR: '#FFA500',\n  RADIUS: 12,\n  VEL: [0,0]\n}\n\nfunction Ship(options){\n  let args = {\n    color: shipDefaults.COLOR,\n    radius: shipDefaults.RADIUS,\n    vel: shipDefaults.VEL,\n    pos: options['pos'],\n    game: options['game']\n  }\n\n  MovingObject.call(this, args)\n}\n\nShip.prototype.relocate = function() {\n  this.pos = this.game.randomPosition()\n  this.vel = [0, 0]\n}\n\nUtil.inherits(Ship, MovingObject);\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\n  inherits(childClass, ParentClass) {\n    function Surrogate(){};\n    Surrogate.prototype = ParentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n\n  // Return a randomly oriented vector with the given length.\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  },\n\n  distance(pos1 ,pos2) {\n    return Math.sqrt((pos1[0] - pos2[0]) ** 2 + (pos1[1] - pos2[1]) ** 2)\n  }\n\n};\n\n\n\n\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;