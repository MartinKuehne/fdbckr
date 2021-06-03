const initPlaceMarker = () => {

const image = document.getElementById('artwork')
const wrapper = document.querySelector('.image-wrapper')
const form = document.querySelector('.simple_form')
  console.log(image)
  console.log(form)

  if (image) {
    image.addEventListener("click", (event) => {
      console.log(event)
      const element = document.createElement('i');
      element.className = 'fas fa-comment marker';
      element.style.left = `${event.offsetX - 7}px`
      element.style.top = `${event.offsetY + 7}px`
      wrapper.appendChild(element)
      
      const hidden_x = document.getElementById('comment_x_offset')
      const hidden_y = document.getElementById('comment_y_offset')
     
      hidden_x.value = event.offsetX
      hidden_y.value = event.offsetY
    })
  }
}

export { initPlaceMarker }

