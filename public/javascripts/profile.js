
function display(tab){
      //console.log((tab.getAttribute('id')));
      feed=document.getElementById('feed');
      wishlist=document.getElementById('wishlist');
      friends=document.getElementById('friends');
      // feed.style.display = 'none';
      // wishlist.style.display = 'none';
      // friends.style.display='none';
       $("#feed").fadeOut();
       $("#wishlist").fadeOut();
       $("#friends").fadeOut();
      reset_tab('feed-btn');
      reset_tab('wishlist-btn');
      reset_tab('friends-btn');
      
      $(document.getElementById(tab.getAttribute('id'))).fadeIn();
      document.getElementById(tab.getAttribute('id')+'-btn').style.backgroundColor= '#2ecc71';
      document.getElementById(tab.getAttribute('id')+'-btn').style.fontWeight='bold';
      document.getElementById(tab.getAttribute('id')+'-btn').style.color='white';
      window.scrollTo(0,0);
     }

function reset_tab(id){
	tabbtn=document.getElementById(id);
	tabbtn.style.backgroundColor='#fff';
      tabbtn.style.fontWeight='normal';
      tabbtn.style.color='black';
}

function call_set_eventnode(){
      var a = document.getElementsByClassName('eventnode');
      for (var index = 0; index < a.length; ++index) {
            set_eventnode(a[index]);
      }
}
 
function set_eventnode(new_node){
      var today= new Date();
      var event_date=new Date(new_node.innerText);
      var days_diff=Math.ceil((event_date.getTime()-today.getTime())/ (1000 * 3600 * 24));
      var dist=(3.3*days_diff);
      var distance=new String(dist);
      //alert(event_date);
      new_node.style.left=distance+"%";
      var date_string=new String(event_date);
      var display_date=date_string.split(" ");
      new_node.title=new String("Birthdays on "+display_date[1]+" "+display_date[2]+" "+display_date[3]);
}


function call_resize_image(){
      var a = document.getElementsByClassName('img-gift');
      for (var index = 0; index < a.length; ++index) {
            resize_image(a[index]);
      }
}

function resize_image(x){
      //console.log(x.height+"x"+x.width);
 	if(x.height>x.width){
		x.style.height='190px';
 		x.style.width='auto';
 	}
 	else{
 		x.style.width='240px';
		x.style.height='auto'; 		
 	}
      //console.log(x.style.height+"x"+x.style.width);
}

 function resize_feedimage(x){
 	if(x.height>x.width){
		x.style.height='500px';
 		x.style.width='auto';
 	}
 	else{
 		x.style.width='500px';
		x.style.height='auto'; 		
 	}

 }
 
 function set_bdaygrid(){
      var a = document.getElementsByClassName('birthday-container');
      if (a.length<2 && a.length>0) {
            document.getElementById('bday-username').style.fontSize="13px"
             // console.log(a[0].innerText);
      };
      for (var index = 0; index < a.length; ++index) {
           
             a[index].title=new String(a[index].innerText);
      }
}
 