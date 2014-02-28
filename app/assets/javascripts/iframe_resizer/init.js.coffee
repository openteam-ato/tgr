@init_iframe_resize = ->

  $('iframe.auto_resize').iFrameResize
    log: false
    autoResize: true
    contentWindowBodyMargin: 0
    doHeight: true
    doWidth: false
    enablePublicMethods: false
    interval: 33
    scrolling: false

  return
