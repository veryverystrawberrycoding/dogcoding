$(function(){
/*

This Snippet is using a modified Stack Blur js lib for blurring the header images.

I could not use hosted images because Canvas cannot work with cross domain images. If you want to use hosted images make sure they are on the same domain.

Have fun!

*/

/*

StackBlur - a fast almost Gaussian Blur For Canvas

Version:     0.5
Author:		Mario Klingemann
Contact: 	mario@quasimondo.com
Website:	http://www.quasimondo.com/StackBlurForCanvas
Twitter:	@quasimondo

In case you find this class useful - especially in commercial projects -
I am not totally unhappy for a small donation to my PayPal account
mario@quasimondo.de

Or support me on flattr: 
https://flattr.com/thing/72791/StackBlur-a-fast-almost-Gaussian-Blur-Effect-for-CanvasJavascript

Copyright (c) 2010 Mario Klingemann

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/



function stackBlurCanvasRGBA( canvas, top_x, top_y, width, height, radius )
{
	if ( isNaN(radius) || radius < 1 ) return;
	radius |= 0;
	
	var context = canvas.getContext("2d");
	var imageData;
	
	try {
	  try {
		imageData = context.getImageData( top_x, top_y, width, height );
	  } catch(e) {
	  
		// NOTE: this part is supposedly only needed if you want to work with local files
		// so it might be okay to remove the whole try/catch block and just use
		// imageData = context.getImageData( top_x, top_y, width, height );
		try {
			netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead");
			imageData = context.getImageData( top_x, top_y, width, height );
		} catch(e) {
			alert("Cannot access local image");
			throw new Error("unable to access local image data: " + e);
			return;
		}

	  } 

	} catch(e) {
	  alert("Cannot access image");
	  throw new Error("unable to access image data: " + e);
	}
			
	var pixels = imageData.data;
			
	var x, y, i, p, yp, yi, yw, r_sum, g_sum, b_sum, a_sum, 
	r_out_sum, g_out_sum, b_out_sum, a_out_sum,
	r_in_sum, g_in_sum, b_in_sum, a_in_sum, 
	pr, pg, pb, pa, rbs;
			
	var div = radius + radius + 1;
	var w4 = width << 2;
	var widthMinus1  = width - 1;
	var heightMinus1 = height - 1;
	var radiusPlus1  = radius + 1;
	var sumFactor = radiusPlus1 * ( radiusPlus1 + 1 ) / 2;
	
	var stackStart = new BlurStack();
	var stack = stackStart;
	for ( i = 1; i < div; i++ )
	{
		stack = stack.next = new BlurStack();
		if ( i == radiusPlus1 ) var stackEnd = stack;
	}
	stack.next = stackStart;
	var stackIn = null;
	var stackOut = null;
	
	yw = yi = 0;
	
	var mul_sum = mul_table[radius];
	var shg_sum = shg_table[radius];
	
	for ( y = 0; y < height; y++ )
	{
		r_in_sum = g_in_sum = b_in_sum = a_in_sum = r_sum = g_sum = b_sum = a_sum = 0;
		
		r_out_sum = radiusPlus1 * ( pr = pixels[yi] );
		g_out_sum = radiusPlus1 * ( pg = pixels[yi+1] );
		b_out_sum = radiusPlus1 * ( pb = pixels[yi+2] );
		a_out_sum = radiusPlus1 * ( pa = pixels[yi+3] );
		
		r_sum += sumFactor * pr;
		g_sum += sumFactor * pg;
		b_sum += sumFactor * pb;
		a_sum += sumFactor * pa;
		
		stack = stackStart;
		
		for( i = 0; i < radiusPlus1; i++ )
		{
			stack.r = pr;
			stack.g = pg;
			stack.b = pb;
			stack.a = pa;
			stack = stack.next;
		}
		
		for( i = 1; i < radiusPlus1; i++ )
		{
			p = yi + (( widthMinus1 < i ? widthMinus1 : i ) << 2 );
			r_sum += ( stack.r = ( pr = pixels[p])) * ( rbs = radiusPlus1 - i );
			g_sum += ( stack.g = ( pg = pixels[p+1])) * rbs;
			b_sum += ( stack.b = ( pb = pixels[p+2])) * rbs;
			a_sum += ( stack.a = ( pa = pixels[p+3])) * rbs;
			
			r_in_sum += pr;
			g_in_sum += pg;
			b_in_sum += pb;
			a_in_sum += pa;
			
			stack = stack.next;
		}
		
		
		stackIn = stackStart;
		stackOut = stackEnd;
		for ( x = 0; x < width; x++ )
		{
			pixels[yi+3] = pa = (a_sum * mul_sum) >> shg_sum;
			if ( pa != 0 )
			{
				pa = 255 / pa;
				pixels[yi]   = ((r_sum * mul_sum) >> shg_sum) * pa;
				pixels[yi+1] = ((g_sum * mul_sum) >> shg_sum) * pa;
				pixels[yi+2] = ((b_sum * mul_sum) >> shg_sum) * pa;
			} else {
				pixels[yi] = pixels[yi+1] = pixels[yi+2] = 0;
			}
			
			r_sum -= r_out_sum;
			g_sum -= g_out_sum;
			b_sum -= b_out_sum;
			a_sum -= a_out_sum;
			
			r_out_sum -= stackIn.r;
			g_out_sum -= stackIn.g;
			b_out_sum -= stackIn.b;
			a_out_sum -= stackIn.a;
			
			p =  ( yw + ( ( p = x + radius + 1 ) < widthMinus1 ? p : widthMinus1 ) ) << 2;
			
			r_in_sum += ( stackIn.r = pixels[p]);
			g_in_sum += ( stackIn.g = pixels[p+1]);
			b_in_sum += ( stackIn.b = pixels[p+2]);
			a_in_sum += ( stackIn.a = pixels[p+3]);
			
			r_sum += r_in_sum;
			g_sum += g_in_sum;
			b_sum += b_in_sum;
			a_sum += a_in_sum;
			
			stackIn = stackIn.next;
			
			r_out_sum += ( pr = stackOut.r );
			g_out_sum += ( pg = stackOut.g );
			b_out_sum += ( pb = stackOut.b );
			a_out_sum += ( pa = stackOut.a );
			
			r_in_sum -= pr;
			g_in_sum -= pg;
			b_in_sum -= pb;
			a_in_sum -= pa;
			
			stackOut = stackOut.next;

			yi += 4;
		}
		yw += width;
	}

	
	for ( x = 0; x < width; x++ )
	{
		g_in_sum = b_in_sum = a_in_sum = r_in_sum = g_sum = b_sum = a_sum = r_sum = 0;
		
		yi = x << 2;
		r_out_sum = radiusPlus1 * ( pr = pixels[yi]);
		g_out_sum = radiusPlus1 * ( pg = pixels[yi+1]);
		b_out_sum = radiusPlus1 * ( pb = pixels[yi+2]);
		a_out_sum = radiusPlus1 * ( pa = pixels[yi+3]);
		
		r_sum += sumFactor * pr;
		g_sum += sumFactor * pg;
		b_sum += sumFactor * pb;
		a_sum += sumFactor * pa;
		
		stack = stackStart;
		
		for( i = 0; i < radiusPlus1; i++ )
		{
			stack.r = pr;
			stack.g = pg;
			stack.b = pb;
			stack.a = pa;
			stack = stack.next;
		}
		
		yp = width;
		
		for( i = 1; i <= radius; i++ )
		{
			yi = ( yp + x ) << 2;
			
			r_sum += ( stack.r = ( pr = pixels[yi])) * ( rbs = radiusPlus1 - i );
			g_sum += ( stack.g = ( pg = pixels[yi+1])) * rbs;
			b_sum += ( stack.b = ( pb = pixels[yi+2])) * rbs;
			a_sum += ( stack.a = ( pa = pixels[yi+3])) * rbs;
		   
			r_in_sum += pr;
			g_in_sum += pg;
			b_in_sum += pb;
			a_in_sum += pa;
			
			stack = stack.next;
		
			if( i < heightMinus1 )
			{
				yp += width;
			}
		}
		
		yi = x;
		stackIn = stackStart;
		stackOut = stackEnd;
		for ( y = 0; y < height; y++ )
		{
			p = yi << 2;
			pixels[p+3] = pa = (a_sum * mul_sum) >> shg_sum;
			if ( pa > 0 )
			{
				pa = 255 / pa;
				pixels[p]   = ((r_sum * mul_sum) >> shg_sum ) * pa;
				pixels[p+1] = ((g_sum * mul_sum) >> shg_sum ) * pa;
				pixels[p+2] = ((b_sum * mul_sum) >> shg_sum ) * pa;
			} else {
				pixels[p] = pixels[p+1] = pixels[p+2] = 0;
			}
			
			r_sum -= r_out_sum;
			g_sum -= g_out_sum;
			b_sum -= b_out_sum;
			a_sum -= a_out_sum;
		   
			r_out_sum -= stackIn.r;
			g_out_sum -= stackIn.g;
			b_out_sum -= stackIn.b;
			a_out_sum -= stackIn.a;
			
			p = ( x + (( ( p = y + radiusPlus1) < heightMinus1 ? p : heightMinus1 ) * width )) << 2;
			
			r_sum += ( r_in_sum += ( stackIn.r = pixels[p]));
			g_sum += ( g_in_sum += ( stackIn.g = pixels[p+1]));
			b_sum += ( b_in_sum += ( stackIn.b = pixels[p+2]));
			a_sum += ( a_in_sum += ( stackIn.a = pixels[p+3]));
		   
			stackIn = stackIn.next;
			
			r_out_sum += ( pr = stackOut.r );
			g_out_sum += ( pg = stackOut.g );
			b_out_sum += ( pb = stackOut.b );
			a_out_sum += ( pa = stackOut.a );
			
			r_in_sum -= pr;
			g_in_sum -= pg;
			b_in_sum -= pb;
			a_in_sum -= pa;
			
			stackOut = stackOut.next;
			
			yi += width;
		}
	}
	
	context.putImageData( imageData, top_x, top_y );
	
}

function BlurStack()
{
	this.r = 0;
	this.g = 0;
	this.b = 0;
	this.a = 0;
	this.next = null;
}

  var BLUR_RADIUS = 40;
  var sourceImages = [];

  $('.src-image').each(function(){
    sourceImages.push($(this).attr('src'));
  });

  $('.avatar img').each(function(index){
    $(this).attr('src', sourceImages[index] );
  });

  var drawBlur = function(canvas, image) {
    var w = canvas.width;
    var h = canvas.height;
    var canvasContext = canvas.getContext('2d');
    canvasContext.drawImage(image, 0, 0, w, h);
    stackBlurCanvasRGBA(canvas, 0, 0, w, h, BLUR_RADIUS);
  }; 
    
  
  $('.card canvas').each(function(index){
    var canvas = $(this)[0];
    
    var image = new Image();
    image.src = sourceImages[index];
    
    image.onload = function() {
      drawBlur(canvas, image);
    }
  }); 


/////////////////////////// 여기서부터는 기능구현 ////////////////////////////////////
function fdRecommend1() {
	
	$.ajax({ 
		type:'post',
		url: '../fdRecommend1',
		success: function(data){
				let rds = [];
				
				function rred () {
				for(var i=0; i<5; i++) {
				let n = Math.floor(Math.random() * data.length);
				if (notSame(n)) {
				rds.push(n);
				} else {
				i--;
				}
				}
				function notSame (n) {
				return rds.every((e) => n !== e);
				}
				return rds;
				}
				if(data.length>3){
				rred();  }
			$(".total_friend_hi").empty(); 
			$(".total_friend_hi").append('<div class="col-md-1"></div>')
			if(data.length<5){
			for(var i=0; i<data.length; i++){
			//var i = Math.random() * data.length
			let fd = '' 
			fd += '<div class="col-md-2"><div class="card2"><canvas class="header-bg" width="250" height="70" id="header-blur"></canvas>'
			fd += '<div class="avatar recommend_img_click" style="cursor:pointer;"><img src="/resources/images/userimg/'+data[i].user_img+'" alt="" /></div>'
			fd += '<div class="content"><p><Strong style="font-size:18px;">'+data[i].user_nick+'</Strong><br><span style="font-size:15px;">'+data[i].user_addr+'</span></p>'
			fd += '<input type="hidden" class="friend_id" value="'+data[i].user_id+'">'
			fd += '<input type="hidden" class="friend_nick" value="'+data[i].user_nick+'">'
			fd += '<input type="hidden" class="friend_name2" value="'+data[i].user_name+'">' 
			fd += '<input type="hidden" class="friend_spacies" value="'+data[i].pet_spacies+'">'
			fd += '<p style="font-size:15px;"><button type="button" class="btn-comment friend_click" id="follow">추가</button></p></div></div></div>' 
			$(".total_friend_hi").append(fd);   
			}   
			$(".total_friend_hi").append('<div class="col-md-1"></div>')
				
			}else { 
			for(var i=0; i<5; i++){
			var a = rds[i]
			let fd = ''
			fd += '<div class="col-md-2"><div class="card2"><canvas class="header-bg" width="250" height="70" id="header-blur"></canvas>'
			fd += '<div class="avatar recommend_img_click" style="cursor:pointer;"><img src="/resources/images/userimg/'+data[a].user_img+'" alt="" /></div>'
			fd += '<div class="content"><p><Strong style="font-size:18px;">'+data[a].user_nick+'</Strong><br><span style="font-size:15px;">'+data[a].user_addr+'</span></p>'
			fd += '<input type="hidden" class="friend_id" value="'+data[a].user_id+'">'
			fd += '<input type="hidden" class="friend_nick" value="'+data[a].user_nick+'">'
			fd += '<input type="hidden" class="friend_name2" value="'+data[a].user_name+'">' 
			fd += '<input type="hidden" class="friend_spacies" value="'+data[a].pet_spacies+'">'
			fd += '<p style="font-size:15px;"><button type="button" class="btn-comment friend_click" id="follow">추가</button></p></div></div></div>' 
			$(".total_friend_hi").append(fd);
			}   
			$(".total_friend_hi").append('<div class="col-md-1"></div>')
			} 
		}    
	})
}  
fdRecommend1(); 

 
 


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
followingList();


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
var flagFollow = true; 
$(".following").on('click', function(){
	flagFollow = true;
	$(this).css('color', '#FF6F61')
	$(".follower").css('color', 'white') 
	
	followingList();
}) 

$(".follower").on('click', function(){
	flagFollow = false; 
	$(this).css('color', '#FF6F61') 
	$(".following").css('color', 'white')
	followerList();
})
 
	

 
$(document).on('click', '.chat_content',function(){
	$(".big_user_img").css("display", "inline") 
	let value = $(this).parent().parent().parent().find(".friend_id").val();
	let img = $(this).parent().prev().find(".profile_click").attr("src");
	let nick = $(this).text()
	$(".user_nick_click").text(nick)

	$(".user_id_click").val(value)  
	$(".big_user_img").attr("src",img); 

	$("#chat-box").empty();
	const eventSource = new EventSource("http://localhost:8082/chat/receiver/"+value+"");
	eventSource.onmessage = (event) => { 
	const data = JSON.parse(event.data);
	initMyMessage(data); 
	} 
})      
  
 
$(document).on('click', '.friend_click', function(){
			$(this).html('팔로잉')
			$(this).attr("disabled", true)
			$(this).css("background-color", "#ed8e82")
			$(this).css("color", "white")
	$.ajax({ 
		type:'post',  
		url: '../fdAdd', 
		data:{ 
			user_id : $(this).parent().parent().find('.friend_id').val(), 
			user_nick : $(this).parent().parent().find('.friend_nick').val(), 
			user_name : $(this).parent().parent().find('.friend_name2').val(),  
			user_img : $(this).parent().parent().parent().parent().find('img').attr("src")
			  
		},
		success: function(data){
			
			followingList(); 
		} 
	})  
	
})

//////////////////////////////////////////////////////////////////////////////////






function getSendMsgBox(receiver, msg, time){
	
	if(receiver!=$("#hidden_id").val()){
		let msgg = ''
			msgg += '<div class="d-flex justify-content-end mb-4"><div class="msg_cotainer_send">'+msg+''
			msgg += '<span class="msg_time_send">'+time+'</span></div><div class="img_cont_msg"><img src=""></div></div>'
			return msgg; 
	}else{  
		let message = ''  
			message += '<div class="d-flex justify-content-start mb-4 outgoing-box">'
			message += '<div class="img_cont_msg">'
			message += '</div><div class="msg_cotainer">'+msg+''
			message += '<span class="msg_time">'+time+'</span></div></div>'
			return message;
	}  
	 
}

function initMyMessage(data){ 
	let chatBox = document.querySelector("#chat-box");
	let msgBox = document.querySelector("#chat-outgoing-msg")
	
	//alert(msgBox.value);
	let chatOutgoingBox = document.createElement("div");
	chatOutgoingBox.className = "outgoing-box";
	let a = data.createAt.substring(5,10)
	let b = data.createAt.substring(11,16)
	let c = a + " " + b
	chatOutgoingBox.innerHTML = getSendMsgBox(data.receiver, data.msg, c); 
	chatBox.append(chatOutgoingBox);     
	msgBox.value='';
	
	 
	document.querySelector("#chat-box").scrollTop = document.querySelector("#chat-box").scrollHeight;  
} 
	  
 

async function addMessage(){
	//let chatBox = document.querySelector("#chat-box");
	let msgBox = document.querySelector("#chat-outgoing-msg")
	
	//let chatOutgoingBox = document.createElement("div");
	//chatOutgoingBox.className="outgoing_box"  
	
	
	let chat = {
		sender:$("#hidden_id").val(), 
		receiver:$(".user_id_click").val(),
		msg:msgBox.value   
	}  
	 
        fetch("http://localhost:8082/chat",{
		method: 'post',
		body : JSON.stringify(chat),
		headers:{
			"Content-Type":"application/json;charset=utf-8"
		}    
	}); 
	

	msgBox.value='';  
	 
}

document.querySelector("#chat-outgoing-button").addEventListener("click", ()=> {
 	addMessage(); 
	  
	 }) 
 

document.querySelector("#chat-outgoing-msg").addEventListener("keydown", (e)=> {
	if(e.keyCode==13){
	addMessage(); 
	}
}) 
 



$(document).on('click','.profile_click',function(){
		let frd = $(this).parent().parent().parent().find(".friend_id").val();
		window.open('/profile?name='+frd+'','','width=850,height=720,left=200,resizable = no, scrollbars = no');
		  
	})    
   

$(document).on('click', '.recommend_img_click', function(){
		var fid = $(this).parent().parent().find(".friend_id").val()
		window.open('/profile?name='+fid+'','','width=850,height=720,left=200,resizable = no, scrollbars = no'); 
})


$(document).on('keyup', '#search_friend', function(){
	if(flagFollow==true){
		$.ajax({
		type:'post',
		url: 'followingList',
		success: function(data){
			const obj = JSON.parse(data);
			var list = obj.frList
			$(".total_friend_view").empty();
			for(var i=0; i<list.length; i++){
			let sch= list[i].follower_nick
			if(sch.indexOf($("#search_friend").val())!=-1){ 	
			fdview=''  
			fdview += '<li><div class="d-flex bd-highlight"><div class="img_cont">'
			fdview += '<img style="cursor:pointer" class= "rounded-circle user_img friend_img profile_click" src="/resources/images/userimg/'+list[i].follower_img+'" alt="img">'
			fdview += '</div><div class="user_info">' 
			fdview += '<span class="chat_content" style="cursor:pointer;"><Strong>'+list[i].follower_nick+'</Strong></span><p style="font-size:12px;">'+list[i].follower_name+'</p></div></div>'
			fdview += '<input type="hidden" class="friend_id" value="'+list[i].follower_id+'"></li>' 
			$(".total_friend_view").append(fdview);     
			}  
			}  
		} 	 
	})  
	} else if(flagFollow=false) { 
	
     $.ajax({
		type:'post',
		url: 'followerList',
		success: function(data){
			$(".total_friend_view").empty();
			const obj = JSON.parse(data); 
			var list = obj.frListt
			for(var i=0; i<list.length; i++){
			let sch= list[i].following_nick 
			if(sch.indexOf($("#search_friend").val())!=-1){ 
			fdview='' 
			fdview += '<li><div class="d-flex bd-highlight"><div class="img_cont">'
			fdview += '<img style="cursor:pointer" class= "rounded-circle user_img friend_img profile_click" src="/resources/images/userimg/'+list[i].following_img+'" alt="img">'
			fdview += '</div><div class="user_info">' 
			fdview += '<span class="chat_content" style="cursor:pointer;"><Strong>'+list[i].following_nick+'</Strong></span><p style="font-size:12px;">'+list[i].following_name+'</p></div></div>'
			fdview += '<input type="hidden" class="friend_id" value="'+list[i].following_id+'"></li>' 
			$(".total_friend_view").append(fdview);      
			}
			} 
		}   
	
	}) 
}	
 	 
	 
	
	 
}) 
})
