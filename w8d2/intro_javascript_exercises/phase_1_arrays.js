Array.prototype.uniq = function() {
  let unique = [];
  // let banana = this;
  this.forEach(function(ele) {
    // debugger
    // console.log(banana)
    if (!unique.includes(ele)){
      unique.push(ele);
    }
  });
  return unique;
}

// console.log([1,1,2,2,2,3,3].uniq())

Array.prototype.twoSum = function() {
  let pairs = [];
  for (let i=0; i < this.length; i++){
    for (let j=i+1; j < this.length; j++){
      if ((this[i] + this[j]) === 0){
        pairs.push([i , j]);
      }
    }
  } 
  return pairs;
}

console.log([1,-1,2,3,-2].twoSum())