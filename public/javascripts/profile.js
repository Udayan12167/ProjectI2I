function display(tab){
      // alert((tab.getAttribute('id')))
      feed=document.getElementById('feed');
      wishlist=document.getElementById('wishlist');
      friends=document.getElementById('friends');
      feed.style.display = 'none';
      wishlist.style.display = 'none';
      friends.style.display='none';
      reset_tab('feed-btn');
      reset_tab('wishlist-btn');
      reset_tab('friends-btn');
      document.getElementById(tab.getAttribute('id')).style.display='block';
      document.getElementById(tab.getAttribute('id')+'-btn').style.backgroundColor= '#16a085';
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
      var dist=(1.65*days_diff);
      var distance=new String(dist);
      //alert(event_date);
      new_node.style.left=distance+"%";
}

function resize_image(x){
 	if(x.height>x.width){
		x.style.height='200px';
 		x.style.width='auto';
 	}
 	else{
 		x.style.width='300px';
		x.style.height='auto'; 		
 	}

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
 
