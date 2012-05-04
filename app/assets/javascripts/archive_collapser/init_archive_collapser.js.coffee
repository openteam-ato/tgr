@init_archive_collapser = ->
  $('.year', '.archive').each ->
    $(this).next('ul').show() if $(this).hasClass('active')

  $('.year', '.archive').click ->
    $this = $(this)

    return false if $this.hasClass('busy')

    $this.addClass('busy').toggleClass('active').next('ul').slideToggle 'slow', ->
      $this.removeClass('busy')

    false
