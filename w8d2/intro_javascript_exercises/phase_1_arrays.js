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

// console.log([1,-1,2,3,-2].twoSum())

Array.prototype.transpose = function() {
  let transposed = [];
  let dimY = this.length
  let dimX = this[0].length
  for (let i = 0; i < dimY; i++) {
    transposed.push(Array(dimX));
  }
  
  for (let i = 0; i < dimY; i++) {
    for (let j = 0; j < dimX; j++) {
      transposed[i][j] = this[j][i];
    }
  }
  return transposed;
}

// console.log([[1,2,3],[1,2,3],[1,2,3]].transpose());