/* This is a manifest file that'll be compiled into including all the files listed below.
 * Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
 * be included in the compiled file accessible from http://example.com/assets/application.js
 * It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
 * the compiled file.
 *
 *= require jquery
 *= require jquery_ujs
 *= require galleria_v-1.2.2.1.js
 *= require galleria.classic_v.js
 *= require jquery.jcarousel.js
 *= require charts
 *= require raphael-min.js
 *= require scale.raphael.js
 *= require regions.js
 *= require init_map.js
 */

function init_galleria() {
  $("#galleria").galleria({
    width: 940,
    imageCrop: 'height',
    thumbCrop: true,
    transitionSpeed: 500,
    preload: 3,
    easing: "galleriaIn",
    showCounter: false,
    transition: "fade",
    transitionInitial: "fade",
    showInfo: true,
    showFullscreen: true
  });
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

function banner_carousel() {
  if ($(".banners_block ul").length) {
    if ($(".banners_block ul li").length > 4) {
      if ($.fn.jcarousel) {
        $(".banners_block ul")
          .addClass("reset")
          .jcarousel({
            auto: 20,
            wrap: "circular",
            scroll: 1,
            setupCallback: function() {
              var prev = $(".banners_block .jcarousel-container .jcarousel-prev");
              var next = $(".banners_block .jcarousel-container .jcarousel-next");
            }
          });
      };
    };
  };
};

$(function() {
  init_galleria();
  slide_opener();
  banner_carousel();
});
