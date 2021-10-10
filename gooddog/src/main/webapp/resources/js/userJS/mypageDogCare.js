let time = 0;
let starFlag = true;
$(function(){
	//alert("start");
	
	//반려견 목록 조회 
	dogList();
	
	// 반려견 정보 추가
	$('.myDogAdd').click(function(){
		dogAdd();
	});
	

	// 차트그리기 
	//createChart(0);
	
	// 이번달 추출하여 변수에 담기 
	let today = new Date();
	let year = today.getFullYear();
	let month = today.getMonth()+1;  // 월
	let date = today.getDate();
	
	let todayStr = year+'-'+month+'-'+date
	
	//셀렉트박스 오늘 날짜로 설정
	$('.weight_date').val(todayStr);
	$('.walk_date').val(todayStr);
	
	$('.selectYear').val(year).prop("selected", true);
	$('.selectMonth').val(month).prop("selected", true);
	
	weightListGraph(year, month, 2);
	walkListGraph(year, month, 2);
	
	//체중 조회 : 년도 변경
    $('#selectYear_weight').change(function() {
        let year = $('#selectYear_weight').val();
		let month = $('#selectMonth_weight').val();
		let pet_no = $('#selectDog_weight').val();
		weightListGraph(year, month, pet_no);
	});	//end of change 
	
	//체중 조회 : 월 변경
    $('#selectMonth_weight').change(function() {
        let year = $('#selectYear_weight').val();
		let month = $('#selectMonth_weight').val();
		let pet_no = $('#selectDog_weight').val();
		weightListGraph(year, month, pet_no);
	});	//end of change 
	
	//체중 조회 : 반려견 변경
    $('#selectDog_weight').change(function() {
        let year = $('#selectYear_weight').val();
		let month = $('#selectMonth_weight').val();
		let pet_no = $('#selectDog_weight').val();
		weightListGraph(year, month, pet_no);
	});	//end of change 
	
	
	//산책 조회 : 년도 변경
    $('#selectYear_walk').change(function() {
        let year = $('#selectYear_walk').val();
		let month = $('#selectMonth_walk').val();
		let pet_no = $('#selectDog_walk').val();
		walkListGraph(year, month, pet_no);
	});	//end of change 
	
	//산책 조회 : 월 변경
    $('#selectMonth_walk').change(function() {
        let year = $('#selectYear_walk').val();
		let month = $('#selectMonth_walk').val();
		let pet_no = $('#selectDog_walk').val();
		walkListGraph(year, month, pet_no);
	});	//end of change 
	
	//산책 조회 : 반려견 변경
    $('#selectDog_walk').change(function() {
        let year = $('#selectYear_walk').val();
		let month = $('#selectMonth_walk').val();
		let pet_no = $('#selectDog_walk').val();
		walkListGraph(year, month, pet_no);
	});	//end of change 

	// 체중입력 kg 단위 
	 $('#weight_content').change(function(){
		let weight= $(this).val();
		$(this).val(weight+'kg');
	});	//end of function		


	//반려견 산책 시간 기록 
	 walkButtonEvt();


}); //end of function

function init(){
  document.getElementById("timer").innerHTML = "00:00:00";
}

function walkButtonEvt(){
  var hour = 0;
  var min = 0;
  var sec = 0;
  var timer;

  // 타이머 : 시작버튼 
  $("#walkPlayBtn").click(function(){
	//alert('play');

    if(starFlag){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      starFlag = false;

      if(time == 0){
        init();
      }

      timer = setInterval(function(){
        time++;

        min = Math.floor(time/60);
        hour = Math.floor(min/60);
        sec = time%60;
        min = min%60;

        var th = hour;
        var tm = min;
        var ts = sec;
        if(th<10){
        th = "0" + hour;
        }
        if(tm < 10){
        tm = "0" + min;
        }
        if(ts < 10){
        ts = "0" + sec;
        }

        document.getElementById("timer").innerHTML = th + ":" + tm + ":" + ts;
      }, 1000);
    } //end of if 
  }); //end of click

  // 타이머 : 일시정지 버튼 
  $("#walkPauseBtn").click(function(){
	//alert('pause');
    if(time != 0){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      clearInterval(timer);
      starFlag = true;
    } //end of if 
  });//end of click

  // 타이머 : 정지버튼 --> 초기화 00:00:00
  $("#walkStopBtn").click(function(){
	//alert('stop');
    if(time != 0){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      clearInterval(timer);
      starFlag = true;
      time = 0;
      init();
    } //end of if 
  });//end of click

  // 산책시간 기록 
  $("#walkInsertBtn").click(function(){
	let pet_noList =[];
	let list_check = $("input[name='dog_check']:checked");
	
	for(var i = 0; i<list_check.length; i++){
		pet_noList[i]=list_check[i].value;
	}
	let currentTime = document.getElementById("timer").innerHTML;
    if(currentTime == '00:00:00'){
		alert('시간 측정 후 기록해주세요.');
    } //end of if
	else if(pet_noList.length==0){
		alert('강아지를 선택해주세요.');
	}
	else {
		$.ajax({
			type:'POST',
			url:"/insertWalk",
			traditional:true, //배열 값을 자바로 넘길 때 사용 !!
			data: {
					pet_no: pet_noList,
					walk_content : currentTime
				  },
			success : function() {
				alert("success"); 
			},
			error: function() {
				alert("ERROR : insertWalk fail" );
			}
		}); //end of ajax		
	} // end of else 
  });//end of click


  	$("#walkListBtn").click(function(){
	let year = $('#selectYear_walk').val();
	let month = $('#selectMonth_walk').val();
	let pet_no = $('#selectDog_walk').val();
	walkListTable(year, month, pet_no);
	
	});

} // end of function walkButtonEvt



// 반려견 목록 조회
function dogList() {
	let pet_no;
	$.ajax({
		type:'post',
		url: '../dogList',
		success: function(data){
			let length = data.doglist.length;
			pet_no = data.doglist[0].pet_no;
			$("#totalPetList").empty(); 
			for(let i=0; i<length; i++) {
				let list = ''
				list += '<article  class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">'
				list += '<div class="dogBox-title">'
				list += '<h3>나의 반려견 정보</h3>'
				list += '</div>'
				list += '<div class="item-content" id="myDogBox">'
				list += '<div class="mydog-wrap" id="myDog">'
				list += '<div class="dog-img" id="previewDog'+i+'">'
				list += '<img src="$../../resources/images/userdog/'+data.doglist[i].pet_img+'" alt="img" style="height:200px">'
				list += '<input type="hidden" class="currentImage" value="'+data.doglist[i].pet_img+'">'
				list += '</div>'
				list += '<input type="file" id="dog_modify_img" name="dog_modify_img" accept="image/*" onchange="previewDog(this,'+i+')" style="width:80%">'
				list += '<div class=myDogInfo-breed>'
				list += '<div class="mainFaceButton" id="mainFaceButton"><img src="../../resources/images/icons/search.png" width="50px" height="50px">견종찾기</div>'
				list += '</div>'
				list += '</div>'
				list += '<header class="myDogInfo-header">'
				list += '<div class="myDogInfoBox">'
				list += '<div class="myDogInfo">'
				list += '<input type="hidden" class="pet_no" value="'+data.doglist[i].pet_no+'">'
				list += '<p>이름</p><input type="text" class="pet_name" value="'+data.doglist[i].pet_name+'">'
				list += '</div>'										
				list += '<div class="myDogInfo">'
				list += '<p>생일</p><input type="text" class="pet_birth" value="'+data.doglist[i].pet_birth+'">'
				list += '</div>'
				list += '<div class="myDogInfo">'
				list += '<p>번호</p><input type="text" class="pet_ident" value="'+data.doglist[i].pet_ident+'">'
				list += '</div>'
				list += '<div class="myDogInfo">'
				list += '<p>성별</p><div class=myDogGender>'
				
				if (data.doglist[i].pet_ident==1){
					list += '암 &nbsp;<input type="radio" value="2" class="user_gender" name="user_gender">'
					list += '수 &nbsp;<input type="radio" value="1" class="user_gender" name="user_gender" checked="checked">'
				} else{
					list += '암 &nbsp;<input type="radio" value="2" class="user_gender" name="user_gender" checked="checked">'
					list += '수 &nbsp;<input type="radio" value="1" class="user_gender" name="user_gender">'
				}			
				list += '</div>'
				list += '</div>'
				list += '<div class="myDogInfo">'
				list += '<p>견종</p><input type="text" class="pet_spacies" value="'+data.doglist[i].pet_spacies+'">'
				list += '</div>'
				list += '<div class="myDogEdit">'
				list += '<div id="pet_modify_btn"><img src="../../resources/images/icons/edit.png" width="30px" height="30px"></div>'
				list += '<div id="pet_delete_btn"><img src="../../resources/images/icons/delete.png" width="30px" height="30px"></div>'
				list += '</div>'
				list += '</div>'
				list += '</div>'
				list += '</div>'
				list += '</article>'
				$("#totalPetList").append(list); 
				
				$("#selectDog_weightAdd").append("<option class='pet_no' value='"+data.doglist[i].pet_no+"'>"+data.doglist[i].pet_name+"</option>");
				$("#selectDog_weight").append("<option class='pet_no' value='"+data.doglist[i].pet_no+"'>"+data.doglist[i].pet_name+"</option>");
				$("#selectDog_walk").append("<option class='pet_no' value='"+data.doglist[i].pet_no+"'>"+data.doglist[i].pet_name+"</option>");
				$("#pet_noList").append('<label><input type="checkbox" name="dog_check" value='+data.doglist[i].pet_no+'>'+data.doglist[i].pet_name+' </label>');
				
			} // end of for 
		} // end of function   
		
	}) // end of ajax
} // end of function dogList 


// 반려견 추가 등록 양식 생성 
function dogAdd(){
	let list = ''
		list += '<article  class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">'
		list += '<div class="dogBox-title">'
		list += '<h3>나의 반려견 정보</h3>'
		list += '<div id="myDogAddCancle"><img src="$../../resources/images/icons/cancel-button.png" alt="cancle" width="30px" height="30px"></div>'
		list += '</div>'
		list += '<div class="item-content" id="myDogBox">'
		list += '<div class="mydog-wrap" id="myDog">'
		list += '<div class="dog-img" id="preview2">'
		list += '<img src="$../../resources/images/userdog/'+'defualt.png'+'" alt="img" style="height:200px;">'
		list += '</div>'
		list += '<input type="file" id="dog_file_add" name="dog_file" accept="image/*" onchange="previewImage1(this)" style="width:80%"/>'
		list += '<div class=myDogInfo-breed>'
		list += '<div class="mainFaceButton" id="mainFaceButton"><img src="../../resources/images/icons/search.png" width="50px" height="50px">견종찾기</div>'
		list += '</div>'
		list += '</div>'
		list += '<header class="myDogInfo-header">'
		list += '<div class="myDogInfoBox">'
		list += '<div class="myDogInfo">'
		list += '<p>이름</p><input type="text" class="pet_name" placeholder="강아지 이름" value="">'
		list += '</div>'										
		list += '<div class="myDogInfo">'
		list += '<p>생일</p><input type="text" class="pet_birth" placeholder="강아지 생일" value="">'
		list += '</div>'
		list += '<div class="myDogInfo">'
		list += '<p>번호</p><input type="text" class="pet_ident" placeholder="강아지 등록번호" value="">'
		list += '</div>'
		list += '<div class="myDogInfo">'
		list += '<p>성별</p><div class=myDogGender>'
		list += '암 &nbsp;<input type="radio" value="2" class="user_gender" name="user_gender">'
		list += '수 &nbsp;<input type="radio" value="1" class="user_gender" name="user_gender">'
		list += '</div>'
		list += '</div>'
		list += '<div class="myDogInfo">'
		list += '<p>견종</p><input type="text" class="pet_spacies" placeholder="견종" value="">'
		list += '</div>'
		list += '<div class="myDogEdit">'
		list += '<div id="pet_insert_btn"><img src="../../resources/images/icons/edit.png" width="30px" height="30px"></div>'
		list += '</div>'
		list += '</div>'
		list += '</div>'
		list += '</div>'
		list += '</article>'
		$("#totalPetList").append(list); 
		
}
// 반려견 추가 등록 취소 
$(document).on('click', '#myDogAddCancle', function(){
		$(this).parent().parent().empty();
});

// 반려견 정보 수정 
$(document).on('click', '#pet_modify_btn', function(){
	
	let pet_img;
	if($('#dog_modify_img')[0].files[0]){
		alert('파일있음');
		pet_img=$('#dog_modify_img')[0].files[0];
	}
	else{
		alert("파일 없음 ")
		pet_img=$(this).parent().parent().parent().parent().find(".currentImage").val();
	}
	
	let fileData = new FormData();
	fileData.append("file", $('#dog_modify_img')[0].files[0]);
	$.ajax({ 
	    type: 'POST',
	    url: '../modifyFileDog',
	    data: fileData,
	    enctype: 'multipart/form-data',
	    processData: false, 
	    contentType: false,
		dataType: "json",
	    cache: false,  
	    success: function () {
		alert("업로드호출") 
	      // Handle upload success
	      // ... 
	    },
	    error: function () {
	      // Handle upload error
	      // ...
	    } 
	 	 });


	$.ajax({
		type:'post',
		url:'../dogModify',
		data: {pet_no : $(this).parent().parent().parent().find(".pet_no").val(),
			   pet_name : $(this).parent().parent().parent().find(".pet_name").val(),
			   pet_birth : $(this).parent().parent().parent().find(".pet_birth").val(),
			   pet_ident : $(this).parent().parent().parent().find(".pet_ident").val(),
			   pet_spacies : $(this).parent().parent().parent().find(".pet_spacies").val(),
			   pet_img : pet_img
				},
		success: function(data) { 
			alert("수정이 완료됐습니다")
			dogList(); 
		} 
	});

}); 

// 반려견 정보 입력 
$(document).on('click', '#pet_insert_btn', function(){

	let fileData = new FormData();
	fileData.append("file", $('#dog_file_add')[0].files[0]);
	$.ajax({ 
    type: 'POST',
    url: '../uploadFile',
    data: fileData,
    enctype: 'multipart/form-data',
    processData: false, 
    contentType: false,
	dataType: "json",
    cache: false,  
    success: function () {
	alert("업로드호출") 
      // Handle upload success
      // ... 
    },
    error: function () {
      // Handle upload error
      // ...
    } 
 	 });

	$.ajax({
		type:'post',
		url:'../petInput',
		data: {pet_no : $(this).parent().parent().parent().find(".pet_no").val(),
			   pet_name : $(this).parent().parent().parent().find(".pet_name").val(),
			   pet_birth : $(this).parent().parent().parent().find(".pet_birth").val(),
			   pet_ident : $(this).parent().parent().parent().find(".pet_ident").val(),
			   pet_spacies : $(this).parent().parent().parent().find(".pet_spacies").val(),
			   pet_img : document.getElementById("dog_file_add").files[0].name
				},
		success: function(data) { 
			alert("입력이 완료됐습니다")
		} 
	});
}); 

// 반려견 정보 삭제   
$(document).on('click', '#pet_delete_btn', function(){
	$.ajax({
		type:'post',
		url:'../dogDelete',
		data: {pet_no : $(this).parent().parent().parent().find(".pet_no").val()},
		success: function(data){
			dogList();
			alert("삭제완료")
		}
	})	
})

// 반려견 체중 조회 - 테이블 버튼 이벤트
$(document).on('click', '#weightListBtn', function(){
	
	let year = $('#selectYear_weight').val();
	let month = $('#selectMonth_weight').val();
	let pet_no = $('#selectDog_weight').val();

	weightListTable(year, month, pet_no);
});

//반려견 체중 조회 
function weightListTable(year, month, pet_no){
		
		$.ajax({
			type:'POST',
			url:"/weightList",
			data: {
				year: year,
				month: month,
				pet_no: pet_no
				},			
			success : function(data) {
				createWeightTable(data)
			},
			error: function() {
				alert("ERROR : weightList data load fail" );
			}
		}); //end of ajax;  
}

//반려견 산책 조회 
function walkListTable(year, month, pet_no){
		
		$.ajax({
			type:'POST',
			url:"/walkList",
			data: {
				year: year,
				month: month,
				pet_no: pet_no
				},			
			success : function(data) {
				createWalkTable(data)
			},
			error: function() {
				alert("ERROR : walkList data load fail" );
			}
		}); //end of ajax;  
}

// 반려견 체중 조회 - 그래프 버튼 이벤트
$(document).on('click', '#weightGraphBtn', function(){
	
	let year = $('#selectYear_weight').val();
	let month = $('#selectMonth_weight').val();
	let pet_no = $('#selectDog_weight').val();
	
	weightListGraph(year, month, pet_no);
});


//반려견 체중 조회 - 그래프
function weightListGraph(year, month, pet_no){
		
		$.ajax({
			type:'POST',
			url:"/weightList",
			data: {
				year: year,
				month: month,
				pet_no: pet_no
				},			
			success : function(data) {
				createWeightGraph(data)
			},
			error: function() {
				alert("ERROR : weightList data load fail" );
			}
		}); //end of ajax;  
}

//반려견 체중 조회 - 그래프
function walkListGraph(year, month, pet_no){
		
		$.ajax({
			type:'POST',
			url:"/walkList",
			data: {
				year: year,
				month: month,
				pet_no: pet_no
				},			
			success : function(data) {
				createWalkGraph(data)
			},
			error: function() {
				alert("ERROR : walkList data load fail" );
			}
		}); //end of ajax;  
}


// 반려견 체중 입력
$(document).on('click', '#weightInsertBtn', function(){
	
	let pet_no = $('#selectDog_weightAdd').val();
	let weight_date = $(this).parent().find('.weight_date').val()
	let weight_content = $(this).parent().find('.weight_content').val()
	
	//입력 검사 
	if (weight_date==''){
		alert('날짜를 입력하세요');
	}
	if (weight_content==''){
		alert('체중을 입력하세요');
	}
	
	if (weight_date != '' && weight_content !=''){
		$.ajax({
			type:'POST',
			url:'/insertWeight',
			data:{pet_no: pet_no,
				  weight_date: weight_date,
				  weight_content: weight_content
				 },
			success:function(msg){
				alert('등록되었습니다.')
			},
			error: function(){
				alert("error : insertWeight")
			}
		}) //end of ajax
	} //end of if	
}); // end of function




function createWeightTable(data){

	$('#weightTable').empty();
	for (let i=0; i<data.weightList.length; i++){
		let list = '<tr style="height:60px;">';
		list += '<td><input class="weight_no" type="hidden" value="'+data.weightList[i].weight_no+'"></td>'
		list += '<td><input class="weight_date" type="date" value="'+data.weightList[i].weight_date+'"></td>'	
		list += '<td style="text-align:right"><input class="weight_content" type="text" value="'+data.weightList[i].weight_content+'"</td>'
		list += '<td style="text-align:left">kg</td>'
		list += '<td style="width:60px;"><img id="weightModifyBtn" src="../../resources/images/icons/edit.png" style="width:30px; height:30px;"></td>'		
		list += '<td style="width:60px;"><img id="weightDeleteBtn" src="../../resources/images/icons/delete.png" style="width:30px; height:30px;"></td>'	
		list += '</tr>'
				
		$('#weightTable').append(list);
	} //end of for
} //end of function createWeightTable

function createWalkTable(data){
	
	$('#walkTable').empty();
	for (let i=0; i<data.walkList.length; i++){
		let list = '<tr style="height:60px;">';
		list += '<td><input class="walk_no" type="hidden" value="'+data.walkList[i].walk_no+'"></td>'
		list += '<td><input class="walk_date" type="date" value="'+data.walkList[i].walk_date+'"></td>'	
		list += '<td style="text-align:right"><input class="weight_content" type="text" value="'+data.walkList[i].walk_content+'"</td>'
		list += '<td style="width:60px;"><img id="walkModifyBtn" src="../../resources/images/icons/edit.png" style="width:30px; height:30px;"></td>'		
		list += '<td style="width:60px;"><img id="walkDeleteBtn" src="../../resources/images/icons/delete.png" style="width:30px; height:30px;"></td>'	
		list += '</tr>'
				
		$('#walkTable').append(list);
	} //end of for
}//end of function createWalkTable



$(document).on('click', '#weightModifyBtn', function(){
	
	let weight_no = $(this).parent().parent().find('.weight_no').val();
	let weight_date = $(this).parent().parent().find('.weight_date').val();
	let weight_content = $(this).parent().parent().find('.weight_content').val();
	
	$.ajax({
		type:'POST',
		url:"/modifyWeight",
		data: {
				weight_no: weight_no,
				weight_date: weight_date,
				weight_content : weight_content
			  },
		success : function() {
			alert("success"); 
		},
		error: function() {
			alert("ERROR : weightList modify fail" );
		}
	}); //end of ajax; 			
		
}); // end of function		

$(document).on('click', '#weightDeleteBtn', function(){
	
	let weight_no = $(this).parent().parent().find('.weight_no').val();
	
	$.ajax({
		type:'POST',
		url:"/deleteWeight",
		data: {
				weight_no: weight_no
			  },
		success : function() {
			alert("success"); 
		},
		error: function() {
			alert("ERROR : weightList modify fail" );
		}
	}); //end of ajax; 		
		
}); // end of function	


// 반려견 체중 그래프 그리기
function createWeightGraph(data){
	
	let weightList = data.weightList; 
	let chartLabels = [];
	let chartData = [];
	let selectDog=$('#selectDog_weight option:selected').text();
	let year = $('#selectYear_weight').val();
	let month = $('#selectMonth_weight').val();
	let lastDate = new Date(year, month, 0);
	let days=lastDate.getDate() 
	let day 
	
	for(let i=1; i<days+1; i++){
		
		let flag = false; 
		chartLabels.push(i); // x축 : 1일 ~ 말일
		
		for(let j=0; j<weightList.length; j++ ){
			
			//리스트에서 날짜만 추출 
			day=weightList[j].weight_date.slice(-2)
			
			// y축 : 산책 정보 데이터가 있을 경우에만 chartData에 값 추가
			if (i==parseInt(day)){
				chartData.push(weightList[j].weight_content);
				flag = true;
				break;
			}
		}
		// y축 : 산책 정보 데이터가 없으면 chartData에 '0' 추가
		if(!flag) chartData.push(0);
	}
	
	// 그래프를 넣을 영역
	let ctx = document.getElementById('myChart').getContext('2d');
	
	let utilityChart = new Chart(ctx, {
	    type: 'bar',
	 
	    // The data for our dataset
	    data: {
	        	labels: chartLabels,
				datasets: [{
	            label: selectDog + '의 체중 변화',
	            fill: false,
	            backgroundColor: 'rgb(84,193,196,0.5)',
	            borderColor: 'rgb(84,193,196)',
				data: chartData
	        }]
	    },
	
	    // Configuration options
	    options: {
	        legend: {
	             labels: {
	                  fontColor: 'black' // label color
	
	                 }
	              },
	        scales: {
	            // y축
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true,
	                    fontColor:'black' // y축 폰트 color
	                }
	             }],
	             // x축
	             xAxes: [{
	                ticks: {
	                    beginAtZero:false,
	                    fontColor:'black' // x축 폰트 color
	                }
	             }]
	        }
	    }
	});
}// end of function createWeightGraph



// 반려견 산책 그래프 그리기
function createWalkGraph(data){
	
	let walkList = data.walkList; 
	let chartLabels = [];
	let chartData = [];
	let selectDog=$('#selectDog_walk option:selected').text();
	
	
	let year = $('#selectYear_walk').val();
	let month = $('#selectMonth_walk').val();
	let lastDate = new Date(year, month, 0);
	let days=lastDate.getDate() 
	let day 
	
	for(let i=1; i<days+1; i++){
		
		let flag = false;
		
		chartLabels.push(i);
		
		for(let j=0; j<walkList.length; j++ ){
			//날짜만 추출 
			day=walkList[j].walk_date.slice(-2)
			if (i==parseInt(day)){
				let min=walkList[j].walk_content.slice(3,5);
				chartData.push(min);
				flag = true;
				break;
			}
			else{
				//alert('else')
			}
		}// end of for 
		
		if(!flag){
		chartData.push(0);
		}
	}
	
	let ctx = document.getElementById('myChart_walk').getContext('2d');
	
	let utilityChart = new Chart(ctx, {
	    type: 'bar',
	 
	    data: {
	        	labels: chartLabels,
				datasets: [{
	            label: selectDog + ' 활동량',
	            fill: false,
	            backgroundColor: 'rgb(255,193,7,0.5)',
	            borderColor: 'rgb(255,193,7)',
				data: chartData
	        }]
	    },
	
	    options: {
		    plugins: {
	      		legend: {
	       		display: false,
	      		},
	        scales: {
	            // y축
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true,
	                    fontColor:'black' // y축 폰트 color
	                }
	             }],
	             // x축
	             xAxes: [{
	                ticks: {
	                    beginAtZero:false,
	                    fontColor:'black' // x축 폰트 color
	                }
	             }]
	        } //end of scales
	    } //end of plugins
		} //end of options
	});
} //end of function createWalkGraph

