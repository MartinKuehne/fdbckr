const initArtworkPhoto = () => {
const fileInput = document.getElementById('artwork_photo');

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
        location.insertAdjacentHTML("beforeend", html);
      };
    };
  });
};
};

export { initArtworkPhoto }
