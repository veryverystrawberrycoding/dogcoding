$(function(){
	
	$('#mainFaceButton').click(function(){
		window.open("/breedCheck",'','width=800,height=500,left=200');
	})
	
	$('#mainbotButton').click(function(){
		window.open("/chatbot",'','width=350,height=500,top=60,left=800');
	})
	
    $('#about_breed').hover(function(){
			$('#about').append('<a>  반려견 사진을 업로드하면 인공지능이 가장 가까운 품종을 판별해줘요</a>')
		},
		function(){
			$('#about').empty()
			
		})
	
	
	

	$('#facecheck').click(function(){
		var filename = $('#file').val().replace("C:\\fakepath\\", "")
		//var filename = 'hi.jpg'
		//alert(filename)
		
		var fileData = new FormData();
		fileData.append("file", $('#file')[0].files[0]);
		
		
		
		$.ajax({
	        type: "POST",
	        url: "/breedCheck",
	        data: fileData,
	        enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
	        dataType: "json",
	        cache : false,
	        success: function(data) {
	          
	        }
	    });
		
		
/*		$.ajax({
	        type : 'POST',                             
	        url : 'http://127.0.0.1:5000/dogface',
	        data : {
	               text:filename
	        },
	        dataType : 'JSON',*/


		$.ajax({
	        type : 'POST',                             
	        url : 'http://127.0.0.1:5000/dogface',
	        data: fileData,
	        enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
	        dataType: "json",
	        cache : false,
	        success : function(result){

				//var result = {'num1':'닥스훈트', 'percent1':'99.69%', 'num2':'푸들', 'percent2':'0.18%', 'num3':'골든리트리버', 'percent3':'0.09%'}
		
				$('#dogfaceresult')	.empty()
				var dogfaceresult = $('#dogfaceresult'); //table tag
				
				
				var list= []

					list +='<div class="dogfacePlace">'
					list +='<img src="/resources/images/dogface/'+filename+'" width="400px" height="400px" style="align:center;">'
					list +='</div>'
					list +='<br><br><br>'
					
				
					list +='<div class="col-lg-10">'
					list +='<h2>result</h2><br>'
					list +='</div>'

					list +='<div class="row c-mb-30">'
					
					list +='<div class="col-lg-4 " data-animation="pullDown">'
					list +='	<div class="dogfacePlace">'
					list +='		<img src="/resources/images/dogface/'+result.num1+'.png" width="300px" height="300px" style="align:center; border-radius:50%">'
					list +='		<h4>'+result.num1+'</h4>'
					list +='		<h4>'+result.percent1+'</h4>'
					list +='	</div>'
					list +='</div>'
					list +='<div class="col-lg-4 " data-animation="pullDown">'
					list +='	<div class="dogfacePlace">'
					list +='		<img src="/resources/images/dogface/'+result.num2+'.png" width="300px" height="300px" style="align:center; border-radius:50%">'
					list +='		<h4>'+result.num2+'</h4>'
					list +='		<h4>'+result.percent2+'</h4>'
					list +='	</div>'
					list +='</div>'
					
					list +='<div class="col-lg-4 " data-animation="pullDown">'
					list +=		'<div class="dogfacePlace">'
					list +='		<img src="/resources/images/dogface/'+result.num3+'.png" width="300px" height="300px" style="align:center; border-radius:50%">'
					list +='		<h4>'+result.num3+'</h4>'
					list +='		<h4>'+result.percent3+'</h4>'
					list +='	</div>'
					list +='</div>'
						
					list +='</div>'
					
					dogfaceresult.append(list)
					
			},

	        error : function(xtr,status,error){
	        	alert(xtr +":"+status+":"+error)
	        	console.log(err)
	        }
 			
		});
		
	});
	
$(document).ready(function(){
      const dfMessenger = document.querySelector('df-messenger');
        dfMessenger.addEventListener('df-messenger-loaded', function () {
            //챗봇 아이콘 위치 조정  
           /* let dfIcon = dfMessenger.shadowRoot.querySelector("#widgetIcon");
               if(dfIcon) {
                    dfIcon.style.bottom = "50px";
                }*/
        dfchat = dfMessenger.shadowRoot.querySelector("df-messenger-chat");
    
        var sheet = new CSSStyleSheet;
        sheet.replaceSync('div.chat-wrapper[opened="true"] { height: 410px; width: 300px; }'); //챗봇 사이즈 
        dfchat.shadowRoot.adoptedStyleSheets = [ sheet ];

      })

   })

});


$(document).on('click', '#mainFaceButton', function(){
	window.open("/breedCheck",'','width=800,height=500,left=200');
});