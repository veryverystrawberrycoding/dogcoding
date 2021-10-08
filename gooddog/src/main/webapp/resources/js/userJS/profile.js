    /* BOOTSNIPP FULLSCREEN FIX */
    if (window.location == window.parent.location) {
        $('#back-to-bootsnipp').removeClass('hide');
    }
    
    
    $('[data-toggle="tooltip"]').tooltip();
    
    $('#fullscreen').on('click', function(event) {
        event.preventDefault();
        window.parent.location = "http://bootsnipp.com/iframe/4l0k2";
    });
    $('a[href="#cant-do-all-the-work-for-you"]').on('click', function(event) {
        event.preventDefault();
        $('#cant-do-all-the-work-for-you').modal('show');
    })
    
    $('[data-command="toggle-search"]').on('click', function(event) {
        event.preventDefault();
        $(this).toggleClass('hide-search');
        
        if ($(this).hasClass('hide-search')) {        
            $('.c-search').closest('.row').slideUp(100);
        }else{   
            $('.c-search').closest('.row').slideDown(100);
        }
    })
    
 


















////////////////////////////////////////////
$("#your_pet").on('click', function(){
	$.ajax({
		type:'post',
		url:'../yourPet',
		data:{
			user_id : $("#your_id").val()
		},success: function(data){
			var leng = data.yourPet.length;
			$("#your_info").empty();  
			for(var i=0; i<leng; i++){ 
			your = '' 	
			your += '<div class="col-sm-12 text-center">'
			your += '<img class="img-responsive center-block" src="'+data.yourPet[i].pet_img+'" style="width:330px; height:330px;"/>'
			your += '<br><br><span>'+data.yourPet[i].pet_name+'</span></div>' 
			your += '<div class="col-sm-1"></div><div class="col-sm-10">' 
			your += '<hr></div><div class="col-sm-1"></div>' 
			alert(your); 
			$("#your_info").append(your);
			}    
		}
	})  
	   
	 
}) 
/*
<div class="col-sm-12 text-center"> 
      		<img class="img-responsive center-block" src="${pet.pet_img}" style="width:330px; height:330px;"/>
      		<br><br>    
      		<span>${ pet.pet_name }</span> 
      		</div> 
      		<div class="col-sm-1"></div>
      		<div class="col-sm-10">
      		<hr>
      		</div> 
      		<div class="col-sm-1"></div>  
*/
$("#your_following").on('click', function(){
	$.ajax({ 
		type:'post',
		url:'../yourFollowing',
		data:{
			user_id : $("#your_id").val()
		},success: function(data){
			if(data!="fail"){
			const obj = JSON.parse(data);
			var list = obj.frList
			alert(list[0].follower_id)
			var fdview = ''
			$("#your_info").empty();
			fdview += '<div class="panel panel-default" style="width:100%"><ul class="list-group" id="contact-list">'
			for(var i=0; i<list.length; i++){
			fdview += '<li class="list-group-item"><div class="container"><div class="row"><div class="col-sm-3">'
			fdview += '<img src="'+list[i].follower_img+'" style="border-radius: 70%;"class="img-responsive img-circle" />'
			fdview += '</div><div class="col-sm-9"><span class="name">&nbsp;&nbsp;'+list[i].follower_nick+'</span><br/>'  
			fdview += '<span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>'
			fdview += '<span class="visible-xs"> <span class="text-muted">'+list[i].follower_name+'</span><br/></span></div><div class="clearfix"></div></div></div></li>' 
			$("#your_info").append(fdview);     
			}
			$("#your_info").append('</ui></div>') 
		} else {
			alert("팔로잉 목록이 없습니다.")
			return false; 
		}  
		}  
	})   
	
	
})
  


$("#your_follower").on('click', function(){ 
	$.ajax({
		type:'post',
		url:'../yourFollower',
		data:{
			user_id : $("#your_id").val()
		},success: function(data){ 
			alert(data); 
			$("#your_info").empty();  
			const obj = JSON.parse(data);  
			var list = obj.frListt 
			var fdview=''
			fdview = ''
			fdview += '<div class="panel panel-default" style="width:100%"><ul class="list-group" id="contact-list">'
			for(var i=0; i<list.length; i++){
			fdview += '<li class="list-group-item"><div class="container"><div class="row"><div class="col-sm-3">'
			fdview += '<img src="'+list[i].following_img+'" style="border-radius: 70%;"class="img-responsive img-circle" />'
			fdview += '</div><div class="col-sm-9"><span class="name">&nbsp;&nbsp;'+list[i].following_nick+'</span><br/>'  
			fdview += '<span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>'
			fdview += '<span class="visible-xs"> <span class="text-muted">'+list[i].following_name+'</span><br/></span></div><div class="clearfix"></div></div></div></li>' 
			$("#your_info").append(fdview);     
			} 
			$("#your_info").append('</ui></div>') 
			} 
	}) 
 
}) 