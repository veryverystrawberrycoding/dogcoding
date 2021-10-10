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
    
function followerList() {
	$.ajax({
		type:'post',
		url: 'followerList',
		success: function(data){
			$(".total_friend_view").empty();
			const obj = JSON.parse(data); 
			var list = obj.frListt
			for(var i=0; i<list.length; i++){
			fdview='' 
			fdview += '<li><div class="d-flex bd-highlight"><div class="img_cont">'
			fdview += '<img style="cursor:pointer" class= "rounded-circle user_img friend_img profile_click" src="/resources/images/userimg/'+list[i].following_img+'" alt="img">'
			fdview += '</div><div class="user_info">' 
			fdview += '<span class="chat_content" style="cursor:pointer;"><Strong>'+list[i].following_nick+'</Strong></span><p style="font-size:12px;">'+list[i].following_name+'</p></div></div>'
			fdview += '<input type="hidden" class="friend_id" value="'+list[i].following_id+'"></li>' 
			$(".total_friend_view").append(fdview);      
			}  
		}   
	
	}) 
}	
	
function followingList() {
	$.ajax({
		type:'post',
		url: 'followingList',
		success: function(data){ 
			$(".total_friend_view").empty();
			const obj = JSON.parse(data);
			var list = obj.frList 
			for(var i=0; i<list.length; i++){
			fdview=''
			fdview += '<li><div class="d-flex bd-highlight"><div class="img_cont">'
			fdview += '<img style="cursor:pointer" class= "rounded-circle user_img friend_img profile_click" src="/resources/images/userimg/'+list[i].follower_img+'" alt="img">'
			fdview += '</div><div class="user_info">' 
			fdview += '<span class="chat_content" style="cursor:pointer;"><Strong>'+list[i].follower_nick+'</Strong></span><p style="font-size:12px;">'+list[i].follower_name+'</p></div></div>'
			fdview += '<input type="hidden" class="friend_id" value="'+list[i].follower_id+'"></li>' 
			$(".total_friend_view").append(fdview);     
			}  
		}  
	 
	})  

}	
	












$.ajax({
	
	type:'post',
	url:'profileTest',
	success : function(data){
		let flag = false; 
		for(var i=0; i<data.length; i++){
			if(data[i].follower_id==$("#your_id").val()){
				flag = true;
			} 
		}
		
		if(flag==true){
			$("#follow_delete").css("display", "inline");
			$("#profile_follow").css("display", "none");
		}else {
			$("#follow_delete").css("display", "none");
			$("#profile_follow").css("display", "inline");
			 
		}
		
	}

})















////////////////////////////////////////////
$("#your_pet").on('click', function(){

	
	dogList();

	 
}) 

// 반려견 목록 조회
function dogList() {
	
	
	$.ajax({
		type:'post',
		url: '../yourPet',
		data:{
			user_id : $("#your_id").val()
		},
		success: function(data){
			let length = data.yourPet.length;
			$("#your_info").empty();  
			for(let i=0; i<length; i++) { 
					$("#your_pet").css("background-color", "#5E7E9B")
					$("#your_pet").css("color", "#FFFFFF")
					$("#your_following").css("background-color", "#FFFFFF")
					$("#your_following").css("color", "#000000")
					$("#your_follower").css("background-color", "#FFFFFF")
					$("#your_follower").css("color", "#000000") 
				
				
				
				
				let list = ''
				list += '<br><article  class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">'
				list += '<div class="dogBox-title">'
				list += '<h3>반려견 정보</h3>'
				list += '</div>'
				list += '<div class="item-content" id="myDogBox">'
				list += '<div class="mydog-wrap" id="myDog">'
				list += '<div class="dog-img">'
				list += '<img src="/resources/images/userdog/'+data.yourPet[i].pet_img+'" alt="img">'
				list += '</div>' 
				list += '</div>'
				list += '<header class="myDogInfo-header">'
				list += '<div class="myDogInfoBox">'
				list += '<div class="myDogInfo">'
				list += '<input type="hidden" class="pet_no" value="'+data.yourPet[i].pet_no+'" readonly>'
				list += '<p>이름</p><input type="text" class="pet_name" value="'+data.yourPet[i].pet_name+'" readonly>'
				list += '</div>'										
				list += '<div class="myDogInfo">'
				list += '<p>생일</p><input type="text" class="pet_birth" value="'+data.yourPet[i].pet_birth+'" readonly>'
				list += '</div>'
				list += '<div class="myDogInfo">'
				list += '<p>번호</p><input type="text" class="pet_ident" value="'+data.yourPet[i].pet_ident+'" readonly>'
				list += '</div>'
				list += '<div class="myDogInfo">'
				list += '<p>성별</p><div class=myDogGender>'
				if (data.yourPet[i].pet_ident==1){
					list += '암 &nbsp;<input type="radio" value="2" class="user_gender" name="user_gender" disabled;>'
					list += '수 &nbsp;<input type="radio" value="1" class="user_gender" name="user_gender" checked="checked" readonly>'
				} else{
					list += '암 &nbsp;<input type="radio" value="2" class="user_gender" name="user_gender" checked="checked" readonly>'
					list += '수 &nbsp;<input type="radio" value="1" class="user_gender" name="user_gender" disabled;>'
				}			
				list += '</div>'
				list += '</div>' 
				list += '<div class="myDogInfo">'
				list += '<p>견종</p><input type="text" class="pet_spacies" value="'+data.yourPet[i].pet_spacies+'" readonly>'
				list += '</div>'
				list += '</div>'
				list += '</div>' 
				list += '</div>'
				list += '</article>'
				$("#your_info").append(list); 
				
					} // end of for 
			
			//alert(data.doglist[0].pet_name)
		} // end of function   
	}) // end of ajax
} // end of function dogList 
dogList();




$("#your_following").on('click', function(){

	$.ajax({ 
		type:'post',
		url:'../yourFollowing',
		data:{
			user_id : $("#your_id").val()
		},success: function(data){ 
			if(data!="fail"){
				$("#your_following").css("background-color", "#5E7E9B")
				$("#your_following").css("color", "#FFFFFF")
	
				$("#your_follower").css("background-color", "#FFFFFF")
				$("#your_follower").css("color", "#000000")
	
				$("#your_pet").css("background-color", "#FFFFFF")
				$("#your_pet").css("color", "#000000")	
				
				
				
			const obj = JSON.parse(data);
			var list = obj.frList
			var fdview = ''
			$("#your_info").empty(); 
			fdview += '<div class="panel panel-default" style="width:100%"><ul class="list-group" id="contact-list">'
			for(var i=0; i<list.length; i++){
			fdview += '<li class="list-group-item"><div class="container"><div class="row"><div class="col-sm-3"><input type="hidden" class="hidden_n_id" value="'+list[i].follower_id+'">'
			fdview += '<img src="/resources/images/userimg/'+list[i].follower_img+'" style="border-radius: 70%; cursor:pointer;" class="img-responsive img-circle neighbor" />'
			fdview += '</div><div class="col-sm-9 align-self-center"><span class="name">&nbsp;&nbsp;'+list[i].follower_nick+'</span><br/>'  
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
			if(data!="fail"){
			$("#your_follower").css("background-color", "#5E7E9B")
			$("#your_follower").css("color", "#FFFFFF")
	
			$("#your_following").css("background-color", "#FFFFFF")
			$("#your_following").css("color", "#000000")
	
			$("#your_pet").css("background-color", "#FFFFFF")
			$("#your_pet").css("color", "#000000")	
				
				 
			$("#your_info").empty();  
			const obj = JSON.parse(data);  
			var list = obj.frListt 
			var fdview=''
			fdview = ''
			fdview += '<div class="panel panel-default" style="width:100%"><ul class="list-group" id="contact-list">'
			for(var i=0; i<list.length; i++){
			fdview += '<li class="list-group-item"><div class="container"><div class="row"><div class="col-sm-3"><input type="hidden" class="hidden_n_id" value="'+list[i].following_id+'">'
			fdview += '<img src="/resources/images/userimg/'+list[i].following_img+'" style="border-radius: 70%; cursor:pointer;"class="img-responsive img-circle neighbor" />'
			fdview += '</div><div class="col-sm-9 align-self-center"><span class="name">&nbsp;&nbsp;'+list[i].following_nick+'</span><br/>'  
			fdview += '<span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>'
			fdview += '<span class="visible-xs"> <span class="text-muted">'+list[i].following_name+'</span><br/></span></div><div class="clearfix"></div></div></div></li>' 
			$("#your_info").append(fdview);        
			} 
			$("#your_info").append('</ui></div>') 
			} else {
				alert("팔로워 목록이 없습니다.")
				return false;
			} 
			}
	})
	
})


$(document).on('click', '.neighbor', function(){
	var fid = $(this).parent().find(".hidden_n_id").val()
	window.open('/profile?name='+fid+'','','width=850,height=720,left=200,resizable = no, scrollbars = no');

})

$(document).on('click','#profile_follow', function(){

	$.ajax({ 
		type:'post', 
		url:'../profileAdd', 
		data : {  
			user_id : $("#your_id").val()
		}, success: function(){
			$("#follow_delete").css("display", "inline");
			$("#profile_follow").css("display", "none");
			opener.parent.followingList();
		} 
	})
	}) 
$(document).on('click','#follow_delete', function(){
	$.ajax({ 
		type:'post', 
		url:'../followDel', 
		data : {  
			user_id : $("#your_id").val()
		}, success: function(){ 
			$("#follow_delete").css("display", "none");
			$("#profile_follow").css("display", "inline");
			window.opener.followingList();
		} 
	})
	
	
	
	

	
	
})

