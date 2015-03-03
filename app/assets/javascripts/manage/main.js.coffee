$ ->
  init_datepicker()
  init_collapser() if $('.need_collapser').length
  init_context_autocomplete() if $('#dataset_dataset_context').length

  $('a.disabled').click ->
    false
