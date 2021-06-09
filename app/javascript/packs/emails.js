import $ from 'jquery';
import 'select2';
import "select2/dist/css/select2.css"

const initEmails = () => {
  $(".emails-input").select2({
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
};

export { initEmails }
