$ ->
  init_collapser() if $('.need_collapser').length

  init_datepicker()

  $('a.disabled').click ->
    false
