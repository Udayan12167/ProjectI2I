$('html').click(function(event)
{
  if(event.target.id == 'notif-dropdown' && ($('#notification-active').attr('id')=='notification-active'))
  {
    console.log("3");
    $('#notification-active').attr('id','notification-inactive');
  }
  else if(event.target.id == 'notif-dropdown' || event.target.id == 'notification-inactive')
  {
      console.log("1");
      $('#notification-inactive').attr('id','notification-active');
  }
  else
  {
    console.log("4");
    $('#notification-active').attr('id','notification-inactive');
  }
});

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

$('.img-gift:even').popover({
          container: 'body',
          html: true,
          trigger: 'hover',
          placement: 'auto left',
          title:'Hey! It works',
          content: 'better feel awesome TEDGlobal is heading to Brazil! In October 2014, in Rio de Janeiro, we will celebrate the outpouring of innovation, energy and creativity taking place all over South America and the global south. The world is changing fast. Fresh thinking can be found in every direction, in emerging geographies as well as in the western hemisphere. Join us in Rio to explore the realities of tomorrow.',
                      });


$('.img-gift:odd').popover({
          container: 'body',
          html: true,
          trigger: 'hover',
          placement: 'auto right',
          title:'Hey! It works',
          content: 'better feel awesome TEDGlobal is heading to Brazil! In October 2014, in Rio de Janeiro, we will celebrate the outpouring of innovation, energy and creativity taking place all over South America and the global south. The world is changing fast. Fresh thinking can be found in every direction, in emerging geographies as well as in the western hemisphere. Join us in Rio to explore the realities of tomorrow.',
});

$('.eventnode').load(
	call_set_eventnode()
)

// $('.img-gift').load(
//     call_resize_image()
//   )

$('img').on('load',function(){
  call_resize_image()
});

$('eventnode').tooltip(options)