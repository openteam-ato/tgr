$ ->
  init_collapser() if $('.need_collapser').length

  $('a.disabled').click ->
    false
