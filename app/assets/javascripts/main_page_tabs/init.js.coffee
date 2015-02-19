@init_main_page_tabs = ->

  disabled = []
  $('.main_page_tabs > ul li').each ->
    disabled.push($(this).index()) if $('a', $(this)).hasClass('disabled')
    return

  $('.main_page_tabs').tabs
    disabled: disabled

  return
