@init_collapser = ->

  wrapper = $('.need_collapser')

  $('.collapser', wrapper).click ->
    $('.collapsible', wrapper).slideToggle('fast')
    return false

  return
