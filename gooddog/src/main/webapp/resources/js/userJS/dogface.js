$(function(){

// 댓글 추가 버튼이 눌렸을 때
// id는 #
$('#btbt').click(function(){
	alert('확인')
	
//http://192.168.0.4:5000/hello
/*fetch('http://192.168.0.4:5000/hello',get)
		 .then(res => res.json())
		 .then(res => {
		   console.log(data);
		   alert('확인')

		})*/
	/*var text_data = '플라스크'
	$.ajax({
        type : 'GET',                             
        url : 'http://192.168.50.27:5000/request',
        data : {
               text:text_data 
        },
        dataType : 'JSON',
        success : function(result){
            alert("result = "+ result.result);
            console.log(result.result)
        },
        error : function(xtr,status,error){
        	alert(xtr +":"+status+":"+error);
        	console.log(err)
        }
	});*/
		
	
})

});
