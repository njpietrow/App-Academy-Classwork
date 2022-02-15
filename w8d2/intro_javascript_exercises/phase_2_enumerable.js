Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

// console.log([1,2,3].myEach(console.log));

Array.prototype.myMap = function (callback) {
    let mapped = [];
    this.myEach(function(ele) {
        mapped.push(callback(ele));
    });
    return mapped;
}

// console.log([1,2,3].myMap(function(ele) {
//     return ele*2;
// }));

Array.prototype.myReduce = function(callback , initialValue) {    
    let array = this;
    if (initialValue === undefined){
        initialValue = this[0];
        array = array.slice(1);
    }
    let total = initialValue;
    array.myEach(function(ele){
        total = callback(total, ele);
    });
    return total;
}

console.log([1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  })); // 6

console.log([1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  }, 25)); // 150