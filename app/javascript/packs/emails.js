const initEmails = () => {
  input = document.querySelector('.emails-input');
  location = document.getElementById('emails');
  /* select the form and after submit we want the prevent default */
  input.addEventListener('keyup', (e) => {
    if (e.keyCode === '13') {

    }
  });
};

export { initEmails }
