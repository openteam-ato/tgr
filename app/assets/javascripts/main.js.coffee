$ ->
  init_chart()      if $(".chart").length
  init_galleria()   if $("#galleria").length
  init_jcarousel()  if $(".banners_block").length
  init_map()        if $("#map").length
  if $(".need_collapser").length
    init_collapser()
    hash_handler()
