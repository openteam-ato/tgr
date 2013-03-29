@init_flowplayer = () ->

  $('div.blasting').flowplayer
    swf: "/assets/flowplayer.swf"
    rtmp: "rtmp://62.76.187.58/raw/"

  true
