 function display(tab){
      //alert(tab.getAttribute('id'));
      feed=document.getElementById('feed');
      wishlist=document.getElementById('wishlist');
      friends=document.getElementById('friends');
      invite=document.getElementById('invite');
      feed.style.display = 'none';
      wishlist.style.display = 'none';
      friends.style.display='none';
      invite.style.display='none';
      document.getElementById(tab.getAttribute('id')).style.display='block';
     }

