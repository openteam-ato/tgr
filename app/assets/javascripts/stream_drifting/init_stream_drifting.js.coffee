@init_stream_drifting = () ->
  jwplayer.key = "SZeRfk9B2yiaCiIDORB62cYchqlDqQok9qZQCr1qkNg="
  $(".river").each (index, item) ->
    id = $(item).attr("id")

    jwplayer(id).setup
      playlist: [
        image: "http://stream.cam.tom.ru/img/#{id}.jpg"
        file: "http://stream.cam.tom.ru/hls/#{id}.m3u8"
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
