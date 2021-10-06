$(function(){
	
	let place_group=0; // 그룹 없음, 전체리스트
	let startPage=1; // 시작 페이지 
	let keyword='';
	//let keyword = $('.place-search > input').val();
	getAjaxMapList(place_group, startPage,keyword);
	
	//mapMaker();
	
	
	
	
   	//let area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
   	let area0 = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주"];
	let area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   	let area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
   	let area3 = ["대덕구","동구","서구","유성구","중구"];
   	let area4 = ["광산구","남구","동구","북구","서구"];
   	let area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
   	let area6 = ["남구","동구","북구","중구","울주군"];
   	let area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   	let area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   	let area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   	let area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   	let area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   	let area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   	let area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   	let area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   	let area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
 	let area16 = ["서귀포시","제주시","남제주군","북제주군"];
 
 	$("select[name=sido]").each(function() {
	
		for (let i=0; i<area0.length; i++){
			$(this).append("<option value='"+area0[i]+"'>"+area0[i]+"</option>");
		}
		
		$("select[name=gugun]").append("<option value=''>구/군 선택</option>");
	
	})//end of each 
	

	
	let addr_1;
	
	// 시도 셀렉트 박스 변경되면 
	$("select[name=sido]").change(function() {
		// 검색창 초기화 
		$('.place-search > input').val('');
		let areaIndenx = $("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		let area = "area" + areaIndenx;
		addr_1 = $(this).val()
		//alert(addr_1);
	
		$("select[name=gugun] option").remove();
		
		if(area == "area0"){
			$("select[name=gugun]").append("<option value=''>구/군 선택</option>");
		}
		else{
			$("select[name=gugun]").append("<option value=''>구/군 선택</option>");
			$.each(eval(area), function() {  //나중에 eval 함수 대체할 것 !! 
			 $("select[name=gugun]").append("<option value='"+this+"'>"+this+"</option>");
			   }); //end of each
			 
		}//end of else
		
		// mapList 재호출 
		getAjaxMapList(place_group, startPage, keyword, addr_1);
	
	}); //end of change  
	
	// 구군 셀렉트 박스 변경되면 
	$("select[name=gugun]").change(function() {
		// 검색창 초기화 
		$('.place-search > input').val('');
		
		let addr_2 = $(this).val()
		//alert(addr_1 +','+ addr_2);
		
		// mapList 재호출 
		getAjaxMapList(place_group, startPage, keyword, addr_1, addr_2);
	});
	
}); //end of function; ======================================================================================




// 위치 정보 필터링 	
$(".place-filter").click(function(){
	
	// 주소창 초기화 
	$("select[name=sido]").val('시/도 선택');
	$("select[name=gugun]").val('');
	// 검색창 초기화 
	$('.place-search > input').val('');
	 // 클릭한 필터링 번호 변수에 저장 
	let place_group = $(this).attr('data-filter');
	//let keyword = '';
	getAjaxMapList(place_group);
	
	
}); // end of click

$('#map-search-btn').click(function(){
	let place_group=0; // 그룹 없음, 전체리스트
	let startPage=1; // 사직 페이지 
	//let addr_1 = $("select[name=sido]").val();
	//let addr_2 = $("select[name=gugun]").val();
	let keyword = $('.place-search > input').val();
	alert(keyword)
	

	getAjaxMapList(place_group, startPage, keyword);
})


// 페이지:  이전 버튼 누르면 페이지 그룹 이동
$(document).on('click', '#prevBtn', function(){
	let startPage=$(this).parent().parent().find('.pageNo:first').val();
	let place_group = $(this).parent().parent().parent().parent().find('.place_group').val();
	let keyword = $('.place-search > input').val();
	let movePage=parseInt(startPage)-1;
	
	if (!keyword) getAjaxMapList(place_group, movePage);
	else getAjaxMapList(place_group, movePage, keyword);
	//alert(movePage);
	
});

// 페이지 : 해당 페이지로 이동 
$(document).on('click', '#pageBtn', function(){
	let movePage=$(this).parent().find('.pageNo').val();
	let place_group = $(this).parent().parent().parent().parent().find('.place_group').val();
	let keyword = $('.place-search > input').val();
	if (!keyword) getAjaxMapList(place_group, movePage);
	else getAjaxMapList(place_group, movePage, keyword);
	
});

// 페이지:  다음 버튼 누르면 페이지 그룹 이동
$(document).on('click', '#nextBtn', function(){
	let endPage=$(this).parent().parent().find('.pageNo:last').val();
	let place_group = $(this).parent().parent().parent().parent().find('.place_group').val();
	let keyword = $('.place-search > input').val();

	let movePage = parseInt(endPage)+1;
	if (!keyword) getAjaxMapList(place_group, movePage);
	else getAjaxMapList(place_group, movePage, keyword);
	//alert(movePage);
	
	
});

//ajax로 Map리스트 받아오기 
function getAjaxMapList(place_group, page, keyword, addr_1, addr_2){
		//alert("getAjaxMapList ==> place_group:"+place_group+ ", page: "+page)
	
		$.ajax({
			url : "ajaxMapList",
			data :{
				place_group : place_group,
				page : page,
				keyword : keyword, 
				addr_1 : addr_1,
				addr_2 : addr_2
			},
			type : "post",
			success:function(data){
				//alert(data.mapList[0].place_name);
				$("#place-info").empty();
				let mapList = data.mapList;
				let place_group=data.place_group;
				let placeCount=data.placeCount;
				let paging = data.paging; 
				let startPage = data.paging.startPage;
				let endPage = data.paging.endPage;
				let keyword = data.keyword;
				let place_info = [];
				
				place_info += '<input class="place_group" type="hidden" value="'+place_group+'">';	
				place_info += '<input class="keyword" type="hidden" value="'+keyword+'">';	
				$.each(mapList, function(i){
					place_info += '<li class="media" id="storebox" >';
					place_info += '<div>';
					place_info += '<a class="media-image" href="mapView?place_no='+mapList[i].place_no+'">';
					//place_info += '<img src="../../resources/images/place/cafe.jpg">';
					place_info += '<img src="../../resources/images/place/place_img/'+mapList[i].place_img+'">';
					place_info += '</a>';
					place_info += '</div>';
					place_info += '<div class="media-body">';
					place_info += '<h4>';
					place_info += '<a class="place_name" id="place_name" href="mapView?place_no='+mapList[i].place_no+'">'+mapList[i].place_name+'&nbsp;</a>';
					place_info += '</h4>';
					place_info += '<p class="item-meta">';
					place_info += '<span class="place_addr">'+mapList[i].place_addr+'&nbsp;</span>';
					place_info += '<p>리뷰 수:${total.total} | 만족도: ${percent} % | ${place.place_tag }</p>'
					place_info += '</p>';
					place_info += '</li>';
				}); //end of each
				
				$("#place-info").append(place_info);
				
				
				// 페이징 =============================
				$(".pagination").empty();

				//alert(startPage+','+endPage);
				//alert(endPage);
				
				// 빈리스트 
				let paging_prev = [];
				let paging_next = [];
				let paging_info = [];
				
				// 이전페이지 버튼 
				paging_prev += '<li class="page-item">'
				//paging_prev += '<a id="prevBtn" class="page-link" href="/ajaxMapList?page='+(startPage-1)+'"/>'
				paging_prev += '<a id="prevBtn" class="page-link" href="#"/>'
				paging_prev += '<i class="fa fa-chevron-left"></i>'
				paging_prev += '</a>'
				paging_prev += '</li>'	
				// 페이지 영역에 추가	
				$(".pagination").append(paging_prev);			
				
				
				// 페이지 그룹 버튼 : 3page씩 표시 
				for(let i=startPage; i<endPage+1; i++){
					paging_info += '<li class="page-item">'
					//paging_info += '<a id="pageBtn" class="page-link" href="/ajaxMapList?page='+i+'"/>'
					paging_info += '<a id="pageBtn" class="page-link" href="#"/>'
					paging_info += '<input class="pageNo" type="hidden" value="'+i+'">'
					paging_info += i
					paging_info += '<span class="sr-only">(current)</span>'
					paging_info += '</a>'
					paging_info += '</li>'
				} // end of for
				//페이지 영역에 추가 
				$(".pagination").append(paging_info);
				
				// 다음페이지 버튼
				paging_next += '<li class="page-item">'
				//paging_next += '<a id="nextBtn" class="page-link" href="/ajaxMapList?page='+(endPage+1)+'"/>'
				paging_next += '<a id="nextBtn" class="page-link" href="#"/>'
				paging_next += '<i class="fa fa-chevron-right"></i>'
				paging_next += '</a>'
				paging_next += '</li>'
				//페이지 영역에 추가 
				$(".pagination").append(paging_next);
							
				mapMaker(mapList);
				
			},
			error: function(){
				alert("error: ajaxMapList : total")
			}
		}) // end of ajax
		
		
		
} //end of function getAjaxMapList;





function mapMaker(mapList){
	
	// 지도 옵션 설정 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.46678006447162, 126.88914422740852), // 지도의 중심좌표 독산역
	        level: 6 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds();    
	
	var j =0 ;			
	for (var i=0, l=mapList.length; i<l; i++){
		//alert(l)

		geocoder.addressSearch(mapList[i].place_addr, function(result, status) {
					
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				// 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					
				// 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: coords // 마커를 표시할 위치
			        //title : positions[j].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        //image : markerImage // 마커 이미지 
			    });
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		       map.setCenter(coords);

				// LatLngBounds 객체에 좌표를 추가합니다				
				//alert(coords);				    
				//bounds.extend(coords);
				//alert(bounds);	

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: mapList[j].place_name // 인포윈도우에 표시할 내용
			    });
			
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));				

				j = j+1;					
			}				
		});
	} // end of for 
	
	// 지도 범위 재설정 
	//setBounds();


	

} // end of function mapMaker




// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}
	
