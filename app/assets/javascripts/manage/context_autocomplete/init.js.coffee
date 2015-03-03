@init_context_autocomplete = ->

  autocomplete_field = $('#dataset_dataset_context')
  context_field = $('#dataset_dataset_context_id')

  items = []
  $('option', context_field).each ->
    return unless $(this).val().length
    items.push({id: $(this).val(), value: $(this).text().trim(), label: $(this).text().trim()})
    return

  autocomplete_field.autocomplete
    minLength: 2
    source: items
    select: (event, ui) ->
      context_field.val(ui.item.id)
      return

  return
