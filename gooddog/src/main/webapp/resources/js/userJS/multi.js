
const eventSource = new EventSource("http://localhost:8082/chat/multi/one");
eventSource.onmessage = (event) => {
const data = JSON.parse(event.data); 
initMyMessage(data); 
}   
    

 

function getSendMsgBox(sender, msg, time, second){ 
	if(sender!=$("#multi_hidden_id").val()){
		let msgg = ''
			msgg += '<div class="incoming_msg"><div class="received_msg">'
			msgg += '<div class="received_withd_msg"><p>'+msg+'</p>'
			msgg += '<span class="time_date">'+time+'</span></div></div></div>'
			return msgg;  
	}else{   
		let message = ''  
			message += '<div class="outgoing_msg"><div class="sent_msg"><p>'+msg+'</p>'
			message += '<span class="time_date">'+time+'</span></div></div>'
			return message;
	} 
	 
	
}

function initMyMessage(data){ 
	let chatBox = document.querySelector(".msg_history");
	let msgBox = document.querySelector("#out_write_msg")
	
	//alert(msgBox.value);
	let chatOutgoingBox = document.createElement("div");
	chatOutgoingBox.className = "outgoing-boxes";
	let a = data.createAt.substring(5,10)
	let b = data.createAt.substring(11,16) 
	let d = data.createAt.substring(17,19)
	let c = a + " " + b 
	chatOutgoingBox.innerHTML = getSendMsgBox(data.sender, data.msg, c, d); 
	chatBox.append(chatOutgoingBox);      
	msgBox.value='';
	
	 
	document.querySelector(".msg_history").scrollTop = document.querySelector(".msg_history").scrollHeight;  
} 
	   
 

async function addMessage(){
	//let chatBox = document.querySelector("#chat-box");
	let msgBox = document.querySelector("#out_write_msg")
	alert(msgBox.value);
	
	 
	let chat = {
		msg:msgBox.value   
	}  
	 
        fetch("http://localhost:8082/multiChat",{
		method: 'post',
		body : JSON.stringify(chat),
		headers:{
			"Content-Type":"application/json;charset=utf-8"
		}       
	});

	
	 
	msgBox.value='';  
	 
}
 
document.querySelector("#msg_send_btn").addEventListener("click", ()=> {
 	if($("#out_write_msg").val()!=''){
 		addMessage();  
}  
	 })   
  

document.querySelector("#out_write_msg").addEventListener("keydown", (e)=> {
	
	console.log(e.keyCode) 
	if(e.keyCode==13){ 
		if($("#out_write_msg").val()!=''){ 
	addMessage(); 
	}
	}
})  
 



$(document).on('click','.profile_click',function(){
		let frd = $(this).parent().parent().parent().find(".friend_id").val();
		window.open('/profile?name='+frd+'','','width=650,height=720,left=200,resizable = no, scrollbars = no');
		  
	})    