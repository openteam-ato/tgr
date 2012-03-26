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

function init_collapser() {
  var wrapper = $('.need_collapser');

  $('.collapse_item').hide();

  wrapper.children('h2').wrapInner('<a class="slider" />').each(function(index, item){ $(item).attr('id', 'item_'+index) }).css('cursor', 'pointer');

  wrapper.click(function(event){
    var $this = $(event.target);

    if ($this.hasClass('busy')){
      return false;
    }

    var id = $this.parent().attr('id');
    $this.parent().attr('id','');
    window.location.hash = id;
    $this.parent().attr('id', id);

    if ($this.hasClass('slider')){
      $('.slider').not($this).removeClass('open').parent().next('.collapse_item').slideUp('slow');
      $this.addClass('busy').parent().next('.collapse_item').css('margin-top', '10px').slideToggle('slow', function(){
        $this.toggleClass('open');
        $this.removeClass('busy');
        if (!$this.hasClass('open')) {
          window.location.hash = 'main';
        };
      });
      return false;
    };
  });

};

function hash_handler(){
  var hash = window.location.hash;
  if (hash.length > 0 && hash.match(/item/)) {
    var target = $(hash);
    window.scrollTo(0, target.offset().top)
    target.children('a').click();
  };
};

$(function() {
  init_galleria();
  slide_opener();
  banner_carousel();
  if ($('.need_collapser').length > 0) {
    init_collapser();
  };
  hash_handler();
});
