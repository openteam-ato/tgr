@init_reports_list = ->
  $('div.content div.reports').each (index, report) ->
    $('li a', $(report)).each (index, link) ->
      $link = $(link)
      href = $link.attr 'href'
      href = href.substr 0, href.lastIndexOf('?') if href.indexOf('?') > 0
      extension = (href.substr href.lastIndexOf('.') + 1).toLowerCase()
      $link.addClass extension
      $link.prepend($('<span class=\'icon\'>&nbsp;</span>')) unless $('span.icon', $link).length

      true

    true

  true
