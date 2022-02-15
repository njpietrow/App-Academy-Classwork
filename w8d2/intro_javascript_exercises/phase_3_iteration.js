Array.prototype.bubbleSort = function() {
    let sorted = false;

    while(!sorted) {
        sorted = true;

        for (let i = 0; i < (this.length - 1); i++) {
            if (this[i] > this[i + 1]) {
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sorted = false;
            }
        }
    }
    return this;
}

// console.log([6,1,2,5,4,8].bubbleSort());

String.prototype.substrings = function() {

    let substrings = [];
    
    for (let i=0; i < this.length; i++){
        for (let j=i+1; j <= this.length; j++){
            substrings.push(this.substring(i , j));
        }
    }
    return substrings;
}

// console.log("abcdefg".substrings());