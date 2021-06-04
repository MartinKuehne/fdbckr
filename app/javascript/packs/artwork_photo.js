const initArtworkPhoto = () => {
const fileInput = document.getElementById('artwork_photos');

if (fileInput) {
  fileInput.addEventListener('change', (e) => {
    const files = e.target.files;
    console.log(files);
    for (const file of files) {
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        let html = `<img class="preview-img" src="${reader.result}", alt="${file.name}"></img>`;
        const location = document.getElementById('artwork-images');
        const cross = document.getElementById('cross');
        location.insertAdjacentHTML("beforeend", html);
        location.style.borderColor="#ebedee";
        location.style.backgroundColor="white";
        cross.remove();
        /* if there is more than one pic show them in rows and fit max height */
      };
    };
  });
};
};

export { initArtworkPhoto }
