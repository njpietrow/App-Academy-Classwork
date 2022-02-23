
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  if(htmlElement.children){
    Array.from(htmlElement.children).forEach(child => {
      child.remove()
    })
  }

  let p = document.createElement('p');
  p.innerText = string;
  htmlElement.appendChild(p);
};

htmlGenerator('Party Time.', partyHeader);