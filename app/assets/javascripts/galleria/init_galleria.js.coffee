@init_galleria = ->
  $('#galleria').galleria({
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
  })

@init_slider = ->
  actual = $(".actual")
  slider = $(".slider", actual)
  info_wrapper = $("<div />", { class: "info_wrapper" }).appendTo(actual)
  info = $("<div />", { class: "info" }).appendTo(info_wrapper)
  text = $("<div />", { class: "text" }).appendTo(info)
  dots = $("<div />", { class: "dots" }).appendTo(info)
  li_index = 0
  $("li", slider).each (index, element) ->
    $(element).addClass("dot#{li_index}").prependTo slider
    li_index += 1
    $("<span />", { id: "dot#{index}" }).appendTo dots
  text.html($("li:last img", slider).attr("data-title"))
  $("span:first", dots).addClass("active")
  slider.show()
  $("span", dots).click ->
    return false if $(this).hasClass("active")
    klass = $(this).attr("id")
    target = $("li.#{klass}", slider)
    change_slide(target)
  timer()

change_slide = (target) ->
  clearInterval(@timeout_interval)
  slider = target.closest(".slider")
  img = $("img", target)
  text = $(".text", target.closest(".actual"))
  dots = $(".dots", target.closest(".actual"))
  text.html(img.attr("data-title"))
  $("##{target.attr('class')}", dots).addClass("active").siblings("span").removeClass("active")
  target.hide().appendTo(slider).stop(true,true).fadeIn 500, ->
    timer()

auto_change = ->
  current_dot = $(".actual .info .dots .active")
  next_dot = if current_dot.next().length then current_dot.next() else $(".actual .info .dots span:first")
  next_li = $(".actual .slider li.#{next_dot.attr('id')}")
  change_slide(next_li)

timer = ->
  @timeout_interval = setTimeout(auto_change, 15000)
