@init_blue_pages_pdf = ->
  blue_pages_link = $("a[href*='blue-pages']")
  href = "#{blue_pages_link.attr('href')}?#{new Date().getTime()}"
  blue_pages_link.attr
    'href': href
    'target': '_blank'

  true
