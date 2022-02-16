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
