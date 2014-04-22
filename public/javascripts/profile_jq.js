
 $('#addwish-btn').click(function(){
            $("#addwish-panel").slideToggle();
          });


 $('#invite-btn').click(function(){
            $("#invite-panel").slideToggle();
            $("#friends-panel").toggle();
            if ($(this).text() == "Invite Friends")
		       $(this).text("View Friends")
		    else
		       $(this).text("Invite Friends");
          });


$('#notification').click(function(){
	$('#notification').css({
		'-webkit-filter': 'none'
	});
})

$('.img-gift').popover({
		  container: 'body',
          html: true,
          trigger: 'hover',
          placement: 'auto right',
          title:'Hey! It works',
          content: 'better feel awesome better feel awesome better feel awesome better feel awesome',
                      });
