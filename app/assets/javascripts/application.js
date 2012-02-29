/* This is a manifest file that'll be compiled into including all the files listed below.
 * Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
 * be included in the compiled file accessible from http://example.com/assets/application.js
 * It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
 * the compiled file.
 *
 *= require jquery
 *= require jquery_ujs
 *= require galleria.js
 *= require galleria.classic.js
 */

function init_galleria() {
  var $galleria = $('#galleria');
  if ($galleria.length > 0) {
    $galleria.galleria({
      // galleria options
      width: 698,
      height: 400,
      transition: 'fade',
      showInfo: false,
      // lightbox options
      lightbox: true,
      overlayBackground: '#fff',
      overlayOpacity: 0.5
    });
  };
};

function slide_opener(){
  $('.slider').click(function(event){
    var link = $(this);

    if (link.hasClass('busy')) {
      return false;
    };

    link.addClass('busy');

    link.parent().siblings('.slider_body').slideToggle('slow',function(){
      link.toggleClass('open');
      link.removeClass('busy');
    });

    return false;
  });
};

$(function() {
  init_galleria();
  slide_opener();
});
