var book_count=parseInt(document.getElementById("book-count").innerText)
var movie_count=parseInt(document.getElementById("movie-count").innerText)
var tv_count=parseInt(document.getElementById("tv-count").innerText)
var game_count=parseInt(document.getElementById("game-count").innerText)
var music_count=parseInt(document.getElementById("music-count").innerText)
var total=book_count+movie_count+tv_count+game_count+music_count

console.log(total+" "+book_count+" "+movie_count+" "+tv_count+" "+game_count+" "+music_count)

var book_count=(book_count/total)
var movie_count=(movie_count/total)
var tv_count=(tv_count/total)
var game_count=(game_count/total)
var music_count=(music_count/total)

console.log(total+" "+book_count+" "+movie_count+" "+tv_count+" "+game_count+" "+music_count)

var data = [
  {
    value: book_count,
    color:"#F7464A"
  },
  {
    value : movie_count,
    color : "#E2EAE9"
  },
  {
    value : tv_count,
    color : "#D4CCC5"
  },
  {
    value : game_count,
    color : "#949FB1"
  },
  {
    value : music_count,
    color : "#4D5360"
  }

]
       var ctx = document.getElementById("myChart").getContext("2d");
      var myNewChart = new Chart(ctx).Doughnut(data);

$('html').click(function(event)
{

   if(event.target.id == 'pool-dropdown' && ($('#magnet-dropdown-active').attr('id')=='magnet-dropdown-active'))
  {
    $('#magnet-dropdown-active').attr('id','magnet-dropdown');
  }
  else if(event.target.id == 'pool-dropdown' || event.target.id == 'magnet-dropdown')
  {
      $('#magnet-dropdown').attr('id','magnet-dropdown-active');
  }
  else
  {
    $('#magnet-dropdown-active').attr('id','magnet-dropdown');
  }

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
            // $('#poolModal').modal();
            });

 $('.col-md-6').hover(function () 
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
//$('eventnode').tooltip(options)
 // ADD SLIDEDOWN ANIMATION TO DROPDOWN //
  $('.dropdown').on('show.bs.dropdown', function(e){
    $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
  });

  // ADD SLIDEUP ANIMATION TO DROPDOWN //
  $('.dropdown').on('hide.bs.dropdown', function(e){
    $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
  });
