function range(start, end) {
  if (start === end) {
    return [start]
  }
  let array = range(start, end - 1)
  array.push(end)
  return array;
}

// console.log(range(1,4))


function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }
  let total = arr[arr.length - 1]; //arr.pop
  return sumRec(arr.slice(0,arr.length - 1)) + total;
}

// console.log(sumRec([1,2,3,4]));

function exponent1(base, exp) {
    if (exp === 0) {
        return 1
    }

    return base * exponent1(base, exp - 1);
}

// console.log(exponent1(5, 2));

function exponent2(base, exp) {
    if (exp === 0) {
        return 1
    }

    if (exp % 2 === 0) {
        return (exponent2(base, exp/2))**2;
    }
    else {
        return base * (exponent2(base, (exp - 1)/2)**2);
    }
}

// console.log(exponent2(5, 3));

function fibonacci(n) {
  if (n < 3){
    return [0,1].slice(0,n)
  }
  let arr = fibonacci(n-1);
  // debugger
  arr.push(arr[arr.length-1] + arr[arr.length-2]);
  return arr;
}

// console.log(fibonacci(5));

function deepDup(arr) {
  if (!(arr instanceof Array)){
    return arr;
  }

  let duped = [];

  for(let i = 0; i < arr.length; i++) {
    duped.push(deepDup(arr[i]));
  }

  return duped;
}

twoDArr = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
];

newTwoDArr = deepDup(twoDArr);

twoDArr[0][0] = ["this","is","differ"]

// console.log(twoDArr);
// console.log(newTwoDArr);
// console.log(newTwoDArr === twoDArr);

function bsearch(arr, target) {
    if (arr.length === 0) {
        return -1;
    }

    let midIdx = Math.floor((arr.length)/2);
    let midVal = arr[midIdx];

    if (target === midVal) {
        return midIdx;
    }
    else if (target < midVal) {
        let left = arr.slice(0, midIdx);
        return bsearch(left, target);
    }
    else {
        let right = arr.slice(midIdx + 1);
        let test = bsearch(right, target);
        if (test === -1) {
            return -1
        }
        return midIdx + 1 + test;
    }
}

// console.log(bsearch([11, 22, 33, 44, 66], 12));

function mergeSort(arr) {
    if (arr.length === 1) {
        return arr;
    }
    let midIdx = Math.floor(arr.length / 2);
    let left = mergeSort(arr.slice(0, midIdx));
    let right = mergeSort(arr.slice(midIdx));


    return merge(left, right)

}

function merge(left, right) {

    let merged = [];
    
    while (left.length > 0 && right.length > 0) {
        if (left[0] > right[0]) {
            merged.push(right.pop());
        }
        else {
            merged.push(left.pop());
        }
    }
    merged.concat(left);
    merged.concat(right);
    return merged;
}


console.log(mergeSort([4,6,2,3,1,5]))