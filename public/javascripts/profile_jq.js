
$('html').click(function(event)
{
  if(event.target.id == 'notif-dropdown' && ($('#notification-active').attr('id')=='notification-active'))
  {
      
    $('#notification-active').attr('id','notification-inactive');
  }
  else if(event.target.id == 'notif-dropdown' || event.target.id == 'notification-inactive')
  {
      
      $('#notification-inactive').attr('id','notification-active');
  }
  else
  {
    
    $('#notification-active').attr('id','notification-inactive');
  }
});



$('#addwish-btn').click(function(){
            $("#addwish-panel").slideToggle();
          });


 $('#invite-btn').click(function(){
            $('#inviteModal').modal();
            $("#invite-panel").show();
            $("#infinite-scrolling").hide();
            //$("#friends-panel").toggle();
          });

$('#pool-request').click(function(){
            console.log("pool modal open");
            $('#poolModal').modal();
            });

 $('.thumbnail').hover(function () 
        {
            $(this).find('.like_button').slideDown("fast");
            $(this).find('.add_delete_button').slideDown("fast");
        },
        function ()
        {
            $(this).find('.like_button').slideUp("fast");
            $(this).find('.add_delete_button').slideUp("fast");
        }
    );


$('.thumbnail:even').popover({
          container: 'body',
          html: true,
          trigger: 'hover',
          placement: 'auto left',
          title:'Hey! It works',
          content: 'better feel awesome TEDGlobal is heading to Brazil! In October 2014, in Rio de Janeiro, we will celebrate the outpouring of innovation, energy and creativity taking place all over South America and the global south. The world is changing fast. Fresh thinking can be found in every direction, in emerging geographies as well as in the western hemisphere. Join us in Rio to explore the realities of tomorrow.',
                      });


$('.thumbnail:odd').popover({
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

$('.birthday-container').load(
  set_bdaygrid()
)

// $('.img-gift').load(
//     call_resize_image()
//   )

function triggerModal(obj) {
   
    $('#basicModal').modal();
}



$('img').on('load',function(){
  call_resize_image()
});

//$('eventnode').tooltip(options)
