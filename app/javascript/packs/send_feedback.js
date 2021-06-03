const initSendFeedback = () => {
  const forms = document.querySelectorAll('form');
  forms.forEach((form) => {
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const artworkId = form.id.split('_').pop()
      const commentTarget = document.getElementById(`comments_for_${artworkId}`);
      const commentContent = document.getElementById(`comment_content_${artworkId}`);
      commentTarget.insertAdjacentHTML('beforeend', commentContent.value);
      commentContent.value = '';
    });
  });
};

export {initSendFeedback}
