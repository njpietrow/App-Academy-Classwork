// import {
//     setInterval,
// } from 'timers/promises';

/* class Clock {
    constructor() {
        let date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes(); //don't forget parentheses so we don't forget to invoke
        this.seconds = date.getSeconds();
        this.printTime();
        setInterval(this._tick.bind(this), 1000);
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        //COME BACK TO 4. Schedule the tick at 1 second intervals.
    }

    printTime() {
        let time = `${this.hours} : ${this.minutes} : ${this.seconds}`;
        console.log(time);
        // Format the time in HH:MM:SS
        // Use console.log to print it.
    }

    _tick() {
        this.seconds += 1;
        if (this.seconds >= 60) {
            this.minutes += 1;
            this.seconds = 0;

            if (this.minutes >= 60) {
                this.hours += 1;
                this.minutes = 0;

                if (this.hours > 24) {
                    this.hours = 1;
                }
            }
        }

        this.printTime();
        // 1. Increment the time by one second.
        // 2. Call printTime.
    }
} */

/*
const clock = new Clock();
*/

/* 
=============================================
*/

/* const readline = require('readline');

reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
    if (numsLeft === 0 ){
        completionCallback(sum);
        reader.close();
        // return;
    } else {
        reader.question("Give me a number: ", answer => {
            let num = parseInt(answer);
            let newSum = sum + num;
            console.log(newSum);
            let newNumsLeft = numsLeft - 1;
            addNumbers(newSum, newNumsLeft, completionCallback);
        });
    }
}; */

/* 
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
 */

/* 
=============================================
*/

/* Function.prototype.myBind = function(context) {
    return () => { //returns function captures this and context
        //this = whatever function calls myBind
        debugger
        this.apply(context);
        // Function.prototype.apply(this, context)//through apply
    }; 
}

class Lamp {
    constructor() {
        this.name = "a lamp";
    }
}

const turnOn = function () {
    console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp" */

/* 
=============================================
*/

/* const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
    // Prompt user to tell us whether el1 > el2; pass true back to the
    // callback if true; else false.
    reader.question(`Is ${el1} > ${el2} ? `, response => {
        if (response === "yes") {
            callback(true);
        } else {
            callback(false);
        }
    });
} */

// askIfGreaterThan(1,2,function(status){ console.log("exceuted " + status)});

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
/* function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
    //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
    //    continue the inner loop. You'll want to increment i for the
    //    next call, and possibly switch madeAnySwaps if you did swap.
    if (i === arr.length - 1) {
        outerBubbleSortLoop(madeAnySwaps);
    } else {
        askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan) => {
            if (isGreaterThan) {
                [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
                madeAnySwaps = true;
            }
            innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
        });
    }
}

// innerBubbleSortLoop([4,3,2,1], 0, false, function() {console.log("In outer bubble sort")});

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.

    if (madeAnySwaps) {
        innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
        sortCompletionCallback(arr);
    }
  }
  
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  //here is the line where outerBubbleSortLoop is actually called
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
}); */

/* 
============================================= 
*/

/* Function.prototype.myThrottle = function(interval) {
    let tooSoon = false;
    return () => {
        if (!tooSoon) {
            tooSoon = true;
            setTimeout(function() {
                tooSoon = false;
            }, interval)
            this();
        }
    }
}

class Neuron {
    fire() {
        console.log("Firing!");
    }
} */

// const neuron = new Neuron();
// When we create a new Neuron,
// we can call #fire as frequently as we want

// The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval2 = setInterval(() => {
//     neuron.fire();
// }, 10);

// You can use clearInterval to stop the firing:
// clearInterval(interval2);

// Using Function#myThrottle, we should be able to throttle
// the #fire function of our neuron so that it can only fire
// once every 500ms:

// neuron.fire = neuron.fire.myThrottle(500);

// const interval3 = setInterval(() => {
//     neuron.fire();
// }, 10);

// This time, if our Function#myThrottle worked correctly,
// the Neuron#fire function should only be able to execute
// every 500ms, even though we're still trying to invoke it
// every 10ms!

// If we want this behavior for ALL neurons, we can do the same logic in the constructor:

/* class Neuron {
    constructor() {
        this.fire = this.fire.myThrottle(500);
    }

    fire() {
        console.log("Firing!");
    }
} */

/* 
============================================= 
*/

Function.prototype.myDebounce = function(interval) {
    let timeout;
    return () => {
        const fnCall = () => {
            timeout = null;
            this();
        }
        // each time this function is called, it will clear the previous timeout
        // and create a new one that invokes fnCall after the interval has passed
        // since the timeout is reset every time the function is invoked, 
        // fnCall will only be called once the interval has passed without any new 
        // invocations
        clearTimeout(timeout);
        timeout = setTimeout(fnCall, interval);
    }
}

class SearchBar {
    constructor() {
      this.query = "";
  
      this.type = this.type.bind(this);
      this.search = this.search.bind(this);
    }
  
    type(letter) {
      this.query += letter;
      this.search();
    }
  
    search() {
      console.log(`searching for ${this.query}`);
    }
}

const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};

searchBar.search = searchBar.search.myDebounce(500);
queryForHelloWorld();