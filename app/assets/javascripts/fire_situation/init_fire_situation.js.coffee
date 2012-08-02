@init_fire_situation = ->
  #news_block = $(".content .inner .article")
  #right_block = $(".right_side", news_block)
  #twitter_link = $("h3 a[href='http://twitter.com/netognya']", news_block)
  #twitter_link.hide()
  #$("<div class='twitter'></div>").appendTo(right_block)
  #twitter_block = $(".twitter", right_block)
  #script = document.createElement("script")
  #script.src = "http://widgets.twimg.com/j/2/widget.js"
  #script.type = "text/javascript"
  #widget = new TWTR.Widget
    #version: 2
    #type: 'profile'
    #rpp: 4
    #interval: 30000
    #width: 250
    #height: 300
    #theme:
      #shell:
        #background: '#548653'
        #color: '#ffffff'
      #tweets:
        #background: '#f7f7f7'
        #color: '#000000'
        #links: '#005eab'
    #features:
      #scrollbar: true
      #loop: true
      #live: true
      #behavior: 'default'

    #}).render().setUser('netognya').start();

  #console.log twitter_html
  #twitter_block.html(twitter_html)
