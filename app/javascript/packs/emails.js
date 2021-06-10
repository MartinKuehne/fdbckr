import $ from 'jquery';
import 'select2';
import "select2/dist/css/select2.css"

const initDisable = () => {
  /* when blurred count the selected elements and if bigger zero do nothing, otherwise disable */
  const textArea = document.querySelector('.select2-search__field')
  const checkInput = document.querySelector('.emails-input.select2-hidden-accessible')
  if (checkInput && textArea) {
  textArea.addEventListener('blur', (e) => {
    let count = 0
    const button = document.querySelector('.submit-artwork')
    const optionInput = document.querySelectorAll('option')
    count = optionInput.length
    if (count === 0) {
      button.disabled = true
    }
  })}
}

const initEmails = () => {
  const emailInput = $(".emails-input")
  if (emailInput) {
    emailInput.select2({
      tags: true,
      placeholder: "Enter Emails",
      createTag: function (params) {
        if (params.term.indexOf('@') === -1) {
          return null;
        } else {
          const button = document.querySelector('.submit-artwork')
          button.disabled = false
          return {
            id: params.term,
            text: params.term
          }
        }
      }
    });
  }
};

export { initEmails, initDisable }
