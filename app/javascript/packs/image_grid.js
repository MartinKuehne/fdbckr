import Masonry from 'masonry-layout';

const initImageGrid = () => {
  const masonElement = document.querySelector(".grid")
  if (masonElement) {
    new Masonry( masonElement, {
      // set itemSelector so .grid-sizer is not used in layout
      itemSelector: '.grid-item',
      // use element for option
      gutter: '.gutter-size',
      percentPosition: true
    })
  }
}

export {initImageGrid};
