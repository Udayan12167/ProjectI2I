(function() {
  jQuery(function() {
    if ($('#infinite-scrolling').size() > 0) {
      return $('#inviteModal').on('scroll', function() {
        var more_posts_url;
        more_posts_url = $('.pagination .next_page a').attr('href');
        if (more_posts_url && $('#inviteModal').scrollTop() > $(document).height() - $('#inviteModal').height() - 60) {
          $('.pagination').html('<img src="/images/ajax-loader.gif" alt="Loading..." title="Loading..." />');
          $.getScript(more_posts_url);
        }
        return;
      });
    }
  });

}).call(this);
