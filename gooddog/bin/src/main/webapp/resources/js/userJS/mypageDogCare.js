
$(function(){
	//alert("start");
	let dogInfo
	
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
	
	let todayStr = year+'-'+month+'-0'+date
	//alert (todayStr)
	//오늘 날짜로 설정
	$('.weight_date').val(todayStr);
		
	//alert(year+','+ month);
	$('#selectYear').val(year).prop("selected", true);
	$('#selectMonth option:eq('+month+')').prop("selected", true);
	//weightListGraph(year, month);
	
	//selectList로 년도를 선택해서 값 추출
    $('#selectYear').change(function() {
        let changeYear = $('#selectYear option:selected').val();

	});	//end of change 
	
			
	//selectList로 월을 선택해서 값 추출
    $('#selectMonth').change(function() {
        let changeMonth = $('#selectMonth option:selected').val();

	});	//end of change 


	 $('#weight_content').change(function(){
		let weight= $(this).val();
		$(this).val(weight+'kg');
	});	//end of function		




}) //end of function


// 반려견 목록 조회
function dogList() {
	$.ajax({
		type:'post',
		url: '../dogList',
		success: function(data){
			let length = data.doglist.length;
			$("#totalPetList").empty(); 
			//alert(data.doglist[0].pet_name) 
			for(let i=0; i<length; i++) {
				let list = ''
				list += '<article  class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">'
				list += '<div class="dogBox-title">'
				list += '<h3>나의 반려견 정보</h3>'
				list += '</div>'
				list += '<div class="item-content" id="myDogBox">'
				list += '<div class="mydog-wrap" id="myDog">'
				list += '<div class="dog-img">'
				list += '<img src="$../../resources/images/profile/'+data.doglist[i].pet_img+'" alt="img">'
				list += '</div>'
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
				//list += '<div class=""><img src="../../resources/images/icons/checked.png" width="30px" height="30px"></div>'
				list += '<div id="pet_modify_btn"><img src="../../resources/images/icons/edit.png" width="30px" height="30px"></div>'
				list += '<div id="pet_delete_btn"><img src="../../resources/images/icons/delete.png" width="30px" height="30px"></div>'
				list += '</div>'
				list += '</div>'
				list += '</div>'
				list += '</div>'
				list += '</article>'
				$("#totalPetList").append(list); 
				
				$("#selectDog_weight").append("<option class='pet_no' value='"+data.doglist[i].pet_no+"'>"+data.doglist[i].pet_name+"</option>");
				$("#selectDog_walk").append("<option class='pet_no' value='"+data.doglist[i].pet_no+"'>"+data.doglist[i].pet_name+"</option>");
				
			} // end of for 
			
			//alert(data.doglist[0].pet_name)
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
		list += '<div class="dog-img">'
		list += '<img src="$../../resources/images/profile/'+'defualt.png'+'" alt="img">'
		list += '<a href="#">프로필 사진 추가</a>'
		list += '</div>'
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
		//list += '<div class=""><img src="../../resources/images/icons/checked.png" width="30px" height="30px"></div>'
		list += '<div id="pet_modify_btn"><img src="../../resources/images/icons/edit.png" width="30px" height="30px"></div>'
		list += '<div id="pet_delete_btn"><img src="../../resources/images/icons/delete.png" width="30px" height="30px"></div>'
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
	$.ajax({
		type:'post',
		url:'../dogModify',
		data: {pet_no : $(this).parent().parent().parent().find(".pet_no").val(),
			   pet_name : $(this).parent().parent().parent().find(".pet_name").val(),
			   pet_birth : $(this).parent().parent().parent().find(".pet_birth").val(),
			   pet_ident : $(this).parent().parent().parent().find(".pet_ident").val(),
			   pet_spacies : $(this).parent().parent().parent().find(".pet_spacies").val()},
		success: function(data) { 
			alert("수정이 완료됐습니다")
		} 
	})
}) 

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
	
	let year = $('#selectYear').val();
	let month = $('#selectMonth').val();
	 
	//alert(year+','+ month);
	weightListTable(year, month);
});

//반려견 체중 조회 
function weightListTable(year, month){
		//alert("start weightListTable");
		
		// 리스트 생성
		let weightList = [];
		
		let pet_no = $('#selectDog_weight').val();
		alert(pet_no);
		$.ajax({
			type:'POST',
			url:"/weightList",
			data: {
				year: year,
				month: month,
				pet_no: pet_no
				},			
			//dataType: "json",
			//contentType: "application/json; charset=utf-8;",
			success : function(data) {
				createWeightTable(data)
			},
			error: function() {
				alert("ERROR : weightList data load fail" );
			}
		}); //end of ajax;  
		//alert(weightList);
}

// 반려견 체중 조회 - 그래프 버튼 이벤트
$(document).on('click', '#weightGraphBtn', function(){
	
	let year = $('#selectYear').val();
	let month = $('#selectMonth').val();
	 
	//alert(year+','+ month);
	weightListGraph(year, month);
});


//반려견 체중 조회 - 그래프
function weightListGraph(year, month){
		//alert("start weightListTable");
		
		let pet_no = $('#selectDog_weight').val();
		//alert("pet_no:"+pet_no);
		$.ajax({
			type:'POST',
			url:"/weightList",
			data: {
				year: year,
				month: month,
				pet_no: pet_no
				},			
			//dataType: "json",
			//contentType: "application/json; charset=utf-8;",
			success : function(data) {
				createWeightGraph(data)
			},
			error: function() {
				alert("ERROR : weightList data load fail" );
			}
		}); //end of ajax;  
		//alert(weightList);
}


// 반려견 체중 입력
$(document).on('click', '#weightInsertBtn', function(){
	let pet_no = $(this).parent().find('.pet_no').val()
	let weight_date = $(this).parent().find('.weight_date').val()
	let weight_content = $(this).parent().find('.weight_content').val()
	//alert(weight_content);
	
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
	
	//alert("성공."  ); 
				//$('#weightTableBox').append('<table id="weightTable">');
				$('#weightTable').empty();
				for (let i=0; i<data.weightList.length; i++){
					//weightList.push(data.weightList[i]);
					//weight_date.push(data.weightList[i].weight_date);
					//weight_content.push(data.weightList[i].weight_content);	
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
				//$('#weightTableBox').append('</table>');
}


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
	let ctx;
	let utilityChart;
	
	let year = $('#selectYear').val();
	let month = $('#selectMonth').val();
	let lastDate = new Date(year, month, 0);
	let days=lastDate.getDate() 
	//alert(typeof(days))
	//alert(days)
	let day 
	
	for(let i=1; i<days+1; i++){
		//alert(weightList[i-1].weight_date);
		chartLabels.push(i);
		//chartData.push(i);
		let flag = false;
		//alert(i)
		for(let j=0; j<weightList.length; j++ ){
			//날짜만 추출 
			day=weightList[j].weight_date.slice(-2)
			//alert('안'+ i+','+j);
			if (i==parseInt(day)){
				//alert(i+','+j+','+"같음"+weightList[j].weight_content)
				chartData.push(weightList[j].weight_content);
				flag = true;
				break;
			}
			else{
				//alert('else')
			}
		}
		
		if(!flag){
		chartData.push(0);
		//alert('break 되니 ???')
		}

	}
	//alert('length: '+chartData.length)
	//alert(chartData)
	

	
	ctx = document.getElementById('myChart').getContext('2d');
	
	utilityChart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',
 
    // The data for our dataset
    data: {
        	//labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
        	labels: chartLabels,
			datasets: [{
            label: selectDog,
            fill: false,
            backgroundColor: 'rgb(84,193,196,0.5)',
            borderColor: 'rgb(84,193,196)',
            //data: [NaN, 10, 5, 2, NaN, 30, 45, 12, 41, 23, 12, 32],
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
}