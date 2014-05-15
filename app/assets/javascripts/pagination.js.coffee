jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      console.log("Bleh")
      more_posts_url = $('.pagination .next_page a').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
            $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
            console.log("YO")
            $.getScript more_posts_url
        return
      return