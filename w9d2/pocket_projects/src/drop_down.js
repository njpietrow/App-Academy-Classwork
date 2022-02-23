
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogsObj) {
  let dogLinks = [];
  for (const [key, value] of Object.entries(dogsObj)) {
    let a = document.createElement("a");
    a.innerHTML = key;
    a.setAttribute('href', value);
    let li = document.createElement("li");
    li.classList.add('dog-link');
    li.appendChild(a);
    dogLinks.push(li);
  }

  return dogLinks;
}

console.log(dogLinkCreator(dogs));

function attachDogLinks() {
  let dogLinks2 = dogLinkCreator(dogs);
  let ul = document.querySelector('.drop-down-dog-list');

  dogLinks2.forEach(link => {
    ul.appendChild(link);
  })
}

function handleEnter() {
  // if triggered, get all lis in ul
  // remove lis class (dog-link)
  let hideUl = document.querySelector(".drop-down-dog-list");
  hideUl.classList.remove('hide');
  // should display when on h3
}

function handleLeave() {
  let hideUl = document.querySelector(".drop-down-dog-list");
  hideUl.classList.add('hide');
}

attachDogLinks();
// handleEnter();
// handleLeave();

let header = document.querySelector("h3");
header.addEventListener('mouseenter', handleEnter);

let ul = document.querySelector(".drop-down-dog-list");
ul.addEventListener('mouseleave', handleLeave);