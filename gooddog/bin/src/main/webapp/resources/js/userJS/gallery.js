$(function(){
	
	$('#galheart').click(function(){
		//alert('하투')
		var name = $(this).attr('src').replace("/resources/images/gallery/", "")
		if (name =='heart.png'){
		$(this).attr('src', $(this).attr('src').replace('heart','noheart'));
		}
		else{
			$(this).attr('src', $(this).attr('src').replace('noheart','heart'));
		}
		
	})
	

	$('#gallery_submit_button').click(function(){
	
		
		var fileData = new FormData();
		fileData.append("file", $('#file')[0].files[0]);
		
		
		$.ajax({
	        type: "POST",
	        url: "/galimg",
	        data: fileData,
	        enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
	        dataType: "json",
	        cache : false,
	        success: function(data) {
	          
	        }
	    });


	});
	
});