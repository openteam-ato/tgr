@init_scroller = () ->
  wrapper = $('.main_page_actual')
  list = $('ul', wrapper).addClass('items')
  $('br', list).remove()
  $('a:last', list).addClass('last_child')

  timer = Object
  images = $('.images', wrapper)
  $('li', list).each (index, item) ->
    link = $('a', $(this))
    link.attr('data-item', index)
    img = $('img', $(this))
    images.append(link.clone().html(img).attr('data-item', index).hide())
    link.hover ->
      $this = $(this)
      return if $this.closest('li').hasClass('hovered')
      timer = setTimeout ->
        $("a[data-item=\"#{$('li.hovered a', list).data('item')}\"]", images).fadeOut()
        $("a[data-item=\"#{$this.data('item')}\"]", images).fadeIn()
        $('li', list).removeClass('hovered')
        $this.closest('li').addClass('hovered')
        return
      , 300
      return
    , ->
      clearTimeout(timer)
      return
    return

  first_item = $('li:first', list).addClass('hovered')
  $("a[data-item=\"#{$('a', first_item).data('item')}\"]", images).show()

  $('.scroller', wrapper)
  .bind 'jsp-initialised', (event, isScrollable) ->
    list.addClass('without_scroll') unless isScrollable
    return
  .jScrollPane
    verticalGutter: 0
    mouseWheelSpeed: 30

  return
