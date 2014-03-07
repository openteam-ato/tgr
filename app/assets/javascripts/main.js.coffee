$ ->
  init_chart()                      if $('.chart').length
  init_galleria()                   if $('#galleria').length
  init_slider()                     if $('.actual .switcher li').length
  init_jcarousel()                  if $('.banners_block').length
  init_main_page_tabs()             if $('.main_page_tabs').length
  init_map_main_page()              if $('.map_wrapper.about_of_region').length
  init_map_municipal_readiness()    if $('.map_wrapper.municipal_readiness').length
  init_tabs()                       if $('.tabs').length
  init_scroller()                   if $('.main_page_actual ul li').length
  init_upload_files()               if $('.appeal_form').length
  init_archive_collapser()          if $('.archive').length
  init_reports_list()               if $('div.reports').length
  init_colorbox()                   if $('.right_side .entry_image img').length
  init_employees_colorbox()         if $('.inner .blue_pages .photo img').length
  init_uppod()                      if $('div.uppod').length
  init_flowplayer()                 if $('div.blasting').length
  init_stream_drifting()            if $('.content .article .river').length
  init_stream_drifting_main_page()  if $('.actual_and_calendar .actual .river').length
  init_blue_pages_pdf()             if $('a[href*=\'blue-pages\']').length
  init_iframe_resize()              if $('#autoIframe').length

  if $('.need_collapser').length
    init_collapser()
    hash_handler()

  $('a.invalid_link').click ->
    false
