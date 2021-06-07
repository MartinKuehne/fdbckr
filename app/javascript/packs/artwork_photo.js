const initArtworkPhoto = () => {
  const fileInput = document.getElementById('artwork_photos');

  if (fileInput) {
    fileInput.addEventListener('change', (e) => {
      const files = e.target.files;
      console.log(files);
      let counter = 1;
      const images = document.querySelectorAll('.preview-img');
      const location = document.getElementById('artwork-images');
      for (const file of files) {
        if (counter < 5 && images.length < 4) {
          counter += 1;
          let reader = new FileReader();
/*           const image = document.querySelector('.preview-img');
          if (images.length === 1) {
            image.style.maxHeight = "100%";
          } else if (images.length === 2) {
            image.style.maxHeight = "50%";
          } else if (images.length === 3) {
            image.style.maxHeight = "33,3%";
          }else if (images.length === 4) {
            image.style.maxHeight = "25%";
          } */
          reader.readAsDataURL(file);
          reader.onload = function() {
            let html = `<img class="preview-img" src="${reader.result}", alt="${file.name}"></img>`;
            const cross = document.getElementById('cross');
            location.insertAdjacentHTML("beforeend", html);
          };
        };
      };
      location.style.borderColor="#ebedee";
      location.style.backgroundColor="white";
      cross.remove();
    });
  };
};

export { initArtworkPhoto }
