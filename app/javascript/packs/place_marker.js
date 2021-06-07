const initPlaceMarker = () => {

const image = document.getElementById('artwork')
const wrapper = document.querySelector('.image-wrapper')
const form = document.querySelector('.simple_form')
const input = document.querySelector('.comment-field')
  console.log(image)
  console.log(form)

  if (image) {
    let counter = 0
    image.addEventListener("click", (event) => {
      const markers = document.querySelectorAll('.marker')
      const lastMarker = markers[markers.length - 1]
      console.log(markers)
      if (lastMarker && counter > 0) {
        lastMarker.remove()
        console.log(lastMarker)

      }

      console.log(event)
      const element = document.createElement('i');
      element.className = 'far fa-dot-circle marker route-pin';
      element.style.left = `${event.offsetX - 7}px`
      element.style.top = `${event.offsetY + 7}px`
      wrapper.appendChild(element)
      
      const hidden_x = document.getElementById('comment_x_offset')
      const hidden_y = document.getElementById('comment_y_offset')
     
      hidden_x.value = event.offsetX
      hidden_y.value = event.offsetY
      console.log(input)
      const targetScroll = input.scrollTop
      window.scrollTo({
        top: 400,
        behavior: 'smooth',
      })

      setTimeout(() => {
        input.focus()
      }, 300)

      counter += 1
    })
  }
}

export { initPlaceMarker }

