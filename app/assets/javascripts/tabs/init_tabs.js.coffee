@init_tabs = ->
  tabs_wrapper = $('.tabs')
  tabs_items   = tabs_wrapper.children('li')

  tabs_wrapper.children('li').each (index, item) ->
    $('.'+$(item).attr('id')).addClass('tab_item').hide()

  tabs_wrapper.click (event) ->
    $this = $(event.target)
    return false if $this.hasClass('active')
    tabs_items.removeClass('active')
    $this.toggleClass('active')
    $('.tab_item').slideUp()
    $('.'+$this.attr('id')).slideDown()

  tabs_items.first().click()
