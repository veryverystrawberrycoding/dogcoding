$(function(){
	
	$('#mainFaceButton').click(function(){
		window.open("/mypageFace",'','width=800,height=500,left=200');
	})

	$('#facecheck').click(function(){
		var filename = $('#file').val().replace("C:\\fakepath\\", "")
		//var filename = 'hi.jpg'
		//alert(filename)
		
		var fileData = new FormData();
		fileData.append("file", $('#file')[0].files[0]);
		
		
		$.ajax({
	        type: "POST",
	        url: "/mypageFace",
	        data: fileData,
	        enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
	        dataType: "json",
	        cache : false,
	        success: function(data) {
	          
	        }
	    });
		
		
		$.ajax({
	        type : 'GET',                             
	        url : 'http://127.0.0.1:5000/dogface',
	        data : {
	               text:filename
	        },
	        dataType : 'JSON',

	        success : function(result){
		
				var replyList = $('#replyList'); //table tag
				replyList.empty();
				
				var tr = $('<tr/>');
				var tr1 = $('<tr/>');
				var tr2 = $('<tr/>');
				var tr3 = $('<tr/>');
				var img = $('<tr/>').html('<img src="../resources/images/dogface/'+filename+'" width="300px" height="300px">')
				var num1 = $('<td/>').html(result.num1)
				var percent1 = $('<td/>').html(result.percent1)
				var num2 = $('<td/>').html(result.num2)
				var percent2 = $('<td/>').html(result.percent2)
				var num3 = $('<td/>').html(result.num3)
				var percent3 = $('<td/>').html(result.percent3)
				
				
				//tr.append(img)
				replyList.append(img)
				
			
				tr1.append(num1)
				tr1.append(percent1)
				replyList.append(tr1)
					
				tr2.append(num2)
				tr2.append(percent2)
				replyList.append(tr2)
					
				tr3.append(num3)
				tr3.append(percent3)
				replyList.append(tr3)
					
			},

	        error : function(xtr,status,error){
	        	alert(xtr +":"+status+":"+error)
	        	console.log(err)
	        }
 			/*timeout:100000 */
		});
		
	});
		
});