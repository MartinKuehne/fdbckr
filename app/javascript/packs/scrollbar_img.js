function initScrollBar() {
  const location = document.querySelector('.hidden-scrollbar');
  const distanceFromPageTop = location.scrollTop;
  console.log(distanceFromPageTop);
  const height = location.scrollHeight - location.clientHeight;
  const scrolled = (distanceFromPageTop / height) * 100;
  document.querySelector(".scroll-bar").style.width =  `${scrolled}%`;
} 

const initScroll = () => {
  const scrollWindow = document.getElementById('artwork-images');
  scrollWindow.addEventListener('scroll', () => initScrollBar())
}



export { initScroll }
