import Masonry from 'masonry-layout';
import $ from "jquery";
import jQueryBridget from 'jquery-bridget';
import imagesLoaded from 'imagesloaded';
jQueryBridget('masonry', Masonry, $);
jQueryBridget( 'imagesLoaded', imagesLoaded, $ );

const initImageGrid = () => {
  const masonElement = $('.grid')
  console.log(masonElement)
  if (masonElement) {
    masonElement.imagesLoaded( function() {
    // init Masonry after all images have loaded
      masonElement.masonry({
        // options...
        itemSelector: '.grid-item',
        // use element for option
        gutter: '.gutter-size',
        percentPosition: true
      });
    });
  }
}

export {initImageGrid};
