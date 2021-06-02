const initPrivacy = () => {
  const label = document.querySelector('.toggle-label');
  if (label) {
    document.querySelector('.toggle').addEventListener("click", (e) => {
      label.classList.toggle('public');
      if (label.classList.contains('public')) {
        label.innerText = 'Public';
      } else {
        console.log("We are here <3");
        label.innerText = 'Private';
      }
    });    
  };
};

export { initPrivacy }
