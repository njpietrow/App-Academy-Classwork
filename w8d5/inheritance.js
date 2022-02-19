/* 
Inheritance via surrogate object
*/
Function.prototype.inherits = function(superClass) {
    function Surrogate(){
    }
    Surrogate.prototype = superClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}


Function.prototype.inherits2 = function(superClass){
    this.prototype = Object.create(superClass.prototype);
    this.prototype.constructor = this;
}




function MovingObject() {
    this.position = "here";
 }

MovingObject.prototype.flying = function(){
    console.log("flying!");
}

function Ship() { 
    MovingObject.call(this);
}
Ship.inherits2(MovingObject);

function Asteroid() {
    MovingObject.call(this);
 }
Asteroid.inherits2(MovingObject);

Asteroid.prototype.smash = function () {
    console.log("CRASH!!!");
}


let ass = new Ship()
let rock = new Asteroid()
let ufo = new MovingObject()
console.log(ass.position)
ass.flying()
// ass.smash()
rock.smash()
//ufo.smash()
console.log(ufo.position)
console.log(Ship.prototype instanceof MovingObject)
console.log(Asteroid.prototype instanceof MovingObject)