function patternMatch(pattern, str){
	let hash = {};
	let arr = str.split(' ');

	if (arr.length !== pattern.length){
		return false;
  }

	for(var i = 0; i < pattern.length; i++){
		let letter = pattern[i];
		let ele = arr[i];

		if (hash[letter] !== undefined) {
			if (ele !== hash[letter]) {
		    return false;
      }
    } 
		
		hash[letter] = ele;
	}

	return true;

};

var pattern = "abba";
var str = "dog cat cat dog";

// console.log(patternMatch(pattern, str)); 
