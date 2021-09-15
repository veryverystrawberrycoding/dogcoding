$(function(){
	
	$("#idOkay").on('click', function(){
		$.ajax({
			type: 'post',
			url: '../idOkay',
			data: {user_id : $("#user_id").val()},
			success: function(data){
				alert(data);
			}
			
			 
			
		})
		
		
	})
	 
	 
})