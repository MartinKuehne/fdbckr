window.addEventListener('scroll',()=> initScrollFunction());

const initScrollFunction = () => {
  const mybutton = document.getElementById("myBtn");
  if (mybutton) {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      mybutton.style.display = "block";
    } else {
      mybutton.style.display = "none";
    }
  }
}

// When the user clicks on the button, scroll to the top of the document
const initTopFunction = () => {
  const mybutton = document.getElementById("myBtn");
  if (mybutton) {

    mybutton.addEventListener('click', (e) => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth',
      })
  })
  }
}

export { initScrollFunction, initTopFunction }
