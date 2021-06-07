import $ from 'jquery';
import 'select2';

const initEmails = () => {
  $(".emails-input").select2({
    tags: true
  });
};

export { initEmails }
