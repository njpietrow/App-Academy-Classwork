function sum(...args){
    // let args = Array.prototype.slice.call(arguments);
    let sum = 0;
    for(let i =0; i < args.length; i++){
        sum = sum + args[i];
    }
    return sum;
};

/* console.log(sum(1, 2, 3, 4) === 10);
console.log(sum(1, 2, 3, 4, 5) === 15);
 */

//-------------------------------------------------

Function.prototype.myBind = function(context, ...bindArgs){
    const that = this;
/*     let bindArgs = Array.prototype.slice.call(arguments);
    bindArgs = bindArgs.slice(1);
 */    
    return function(...callArgs){
        // let callArgs = Array.prototype.slice.call(arguments);
        that.call(context, ...bindArgs.concat(callArgs));
    }
};

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

/* const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true */


//-------------------------------------------------

function curriedSum(numArgs) {
  let numbers = [];

  return function _curriedSum(num){
    numbers.push(num);
    if (numbers.length === numArgs){
      return numbers.reduce((acc, el) => { acc + el });
    } else {
      return _curriedSum;
    }
  }
}

/* const sumFunc = curriedSum(4);
console.log(sumFunc(5)(30)(20)(1)); // => 56 */

//-------------------------------------------------

Function.prototype.curry = function(numArgs) {
  let args = [];
  const that = this;

  return function _curry(...callArgs) {
    debugger 
    callArgs.forEach((ele) => {
      args.push(ele);
    })
    if (args.length === numArgs) {
      // return that.apply(that, args);
      return that.call(that, ...args);
    } else {
      return _curry;
    }
  }
}

function boringAddThreeNumbers(num1, num2, num3) {
  console.log(num1 + num2 + num3);
}

boringAddThreeNumbers.curry(3)(1)(2)(3);
boringAddThreeNumbers.curry(3)(1, 2, 3);

