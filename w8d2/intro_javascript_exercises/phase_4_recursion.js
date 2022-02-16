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

