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
 
