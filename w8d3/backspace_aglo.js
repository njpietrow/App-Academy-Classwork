function heyHey(S, T) {

    let arr1 = []
    let arr2 = []
    
    for (let i = 0; i < S.length; i++) {
    
            if (S[i] === '#') {
                arr1.pop();
            }
        
            else {
                arr1.push(S[i]);
            }
    }
    
    for (let i = 0; i < T.length; i++) {
    
            if (T[i] === '#') {
                arr2.pop();
            }
    
            else { 
                arr2.push(T[i]);
            }
    }
    
    return (arr1.join('') === arr2.join(''));
}

let S = 'ab#d';
let T = 'ad#c';
console.log(heyHey(S, T));
    