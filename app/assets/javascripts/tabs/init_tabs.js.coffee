@init_tabs = ->
  tabs_wrapper = $('.tabs')
  tabs_items   = tabs_wrapper.children('li')

  tabs_wrapper.children('li').each (index, item) ->
    $('.'+$(item).attr('id')).addClass('tab_item').hide()

  tabs_wrapper.click (event) ->
    $this = $(event.target)
    return false if $this.hasClass('active')
    $this.siblings().removeClass('active');
    $this.toggleClass('active')
    $this.parent().siblings('.tab_item').slideUp()
    $this.parent().siblings('.'+$this.attr('id')).slideDown()

  tabs_wrapper.each (index, item) ->
    $(item).children('li').first().click()
