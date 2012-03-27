function get_center(box) {
  var x = box.x + box.width/2;
  var y = box.y + box.height/2 + 30;
  return {'x': x, 'y': y};
};

Raphael.el.tooltip = function (title) {
  var object = this;
  var object_box = object.getBBox();
  var center = get_center(object_box);

  if ($('.tooltip').length <= 0) {
    $('#map').after($('<div />').addClass('tooltip').hide());
  };

  var tooltip = $('.tooltip');

  object.hover(
      function(event){
        tooltip.stop(true, true);
        tooltip.html(object.stored_attr.title).css({'left': center.x, 'top': center.y, 'position': 'absolute'}).fadeIn();
      },
      function(event){
        tooltip.fadeOut();
      });

  return object;
};

function resizePaper(paper){
  var win = $(this);
  paper.changeSize(win.width(), win.height(), true, false);
  paper.customAttributes.stored_attr = {};
};

function set_id_to_links(name, id) {
  $('#'+name+'_item a').attr('id', id);
};

function draw_map(){
  var paper = ScaleRaphael('map', 490, 350);

  var region_attr = {
    'cursor': 'pointer',
    'fill': '#fffac8',
    'stroke': '#847e6c',
    'stroke-width': 1,
    'stroke-linejoin': 'round'
  };

  var city_attr = {
    'cursor': 'pointer',
    'fill': '#ef953c',
    'stroke': '#777061',
    'stroke-width': 1,
    'stroke-linejoin': 'round'
  };

  var selected_attr = {
    'fill': '#8cc88c',
    'stroke': '#378437'
  };

  $(regions).each(function (index, region) {
    var paper_item = paper.path(region.path);
    var temp = {};

    if ( region.type == 'city' ) {
      paper_item.attr(city_attr);
      $.extend(temp, city_attr)
      paper_item.stored_attr = temp;
    }else{
      paper_item.attr(region_attr);
      $.extend(temp, region_attr)
      paper_item.stored_attr = temp;
    };

    paper_item.stored_attr.name = region.name;
    paper_item.stored_attr.title = region.title;
    paper_item.stored_attr.url = region.url;
    paper_item.tooltip();

    set_id_to_links(region.name, paper_item.id);

    paper_item
      .hover(
        function(){ var object = this; object.animate(selected_attr, 200); $('#'+object.stored_attr.name+'_item a').addClass('hover'); },
        function(){ var object = this; object.animate(object.stored_attr, 200); $('#'+object.stored_attr.name+'_item a').removeClass('hover'); }
      )
      .click(function(){
        var object = this;
        if (object.stored_attr.url){
          document.location = object.stored_attr.url;
        }else{
          return false;
        };
      });
  });

  return paper;
};

function init_map() {
  var paper = draw_map();
  $('.map_desc li a').hover(
    function(){ paper.getById($(this).attr('id')).animate({'fill': '#8cc88c', 'stroke':'#378437'}, 200); },
    function(){ var object = paper.getById($(this).attr('id')); object.animate(object.stored_attr, 200); }
  );
};
