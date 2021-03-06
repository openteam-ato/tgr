@init_stream_drifting = () ->
  jwplayer.key = "SZeRfk9B2yiaCiIDORB62cYchqlDqQok9qZQCr1qkNg="
  $(".river").each (index, item) ->
    id = $(item).attr("id")

    jwplayer(id).setup
      playlist: [
        image: "http://62.76.185.224/img/#{id}.jpg"
        file: "http://62.76.185.224/hls/#{id}.m3u8"
      ]
      logo:
        file: "http://stream.cam.tom.ru/img/logo.png"
        link: "http://cam.tom.ru/"
      flashplayer: "/assets/jwplayer.swf"
      width: "640"
      height: "360"
      fallback: false

    true

  true

@init_stream_drifting_main_page = () ->
  jwplayer.key = "SZeRfk9B2yiaCiIDORB62cYchqlDqQok9qZQCr1qkNg="

  jwplayer('river3').setup
    playlist: [
      image: "http://62.76.185.224/img/river3.jpg"
      file: "http://62.76.185.224/hls/river3.m3u8"
    ]
    logo:
      file: "http://stream.cam.tom.ru/img/logo.png"
      link: "http://cam.tom.ru/"
    flashplayer: "/assets/jwplayer.swf"
    width: "618"
    height: "348"
    fallback: false

  true
