$(function(){
   var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
   var area3 = ["대덕구","동구","서구","유성구","중구"];
   var area4 = ["광산구","남구","동구",     "북구","서구"];
   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
   var area6 = ["남구","동구","북구","중구","울주군"];
   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

 

	 // 시/도 선택 박스 초기화
	
	 $("select[name=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });
	
	 
	
	 // 시/도 선택시 구/군 설정	
	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  alert(area)
	  

	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화
	
	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });


	
	
	// 지도 옵션 설정 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.46678006447162, 126.88914422740852), // 지도의 중심좌표 독산역
	        level: 5 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

/*	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

			// 지도 중심좌표를 접속위치로 변경합니다
	    	map.setCenter(locPosition);      
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
   
*/
	
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	// 장소 이름 가져오기 
	var place_name = $('.place_name').text().split('>');
	
	// 장소 주소 가져오기 
	var place_addr = $('.place_addr').text().split('>');
	
	
	// 장소 이름, 주소 배열에 담기 
	var positions = []
	
	for ( var i=1, l=place_name.length; i<l; i++){
		
		positions.push({content:'<div>'+ place_name[i] + '</div>',latlng: place_addr[i]})
	}
	//alert(positions[0].title)
	
	
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds();    
	
	var j =0 ;			
	for (var i=0, l=positions.length; i<l; i++){

		geocoder.addressSearch(positions[i].latlng, function(result, status) {
					
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
			        content: positions[j].content // 인포윈도우에 표시할 내용
			    });
			
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));				




				j = j+1;					
			}				
		});
	}
	// 지도 범위 재설정 
	//setBounds();

	
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



		  
	
	
	
	
	// 위치 정보 필터링 	
	$(".place-filter").click(function(){
		//현재 url 가져오기 
		var currentUrl = window.location.href; 
		
		// 현재 url에 문자열 추가 
		var baseUrl = "http://localhost:8082/mapList" ;
		
		// 선택된 태그의 data-fillter 속성 가져오기 
		var keyword = $(this).attr('data-filter');
				
		// 반환할 url 변수 선언
		var url
		
		// 페이지 파라미터 제거하기 
		if(currentUrl.includes("page")){
			//url 초기화 			
			currentUrl = baseUrl;					
		}
		
		// 중복 keyword 허용하지 않음 
		// 현재 url에 keyword가 있으면 = 이후 data-fillter 숫자 교체 
		if(currentUrl.includes("keyword")){
			var index = currentUrl.indexOf('=')+1;
			url = currentUrl.replace(currentUrl[index],keyword)
		}
		// 현재 url에 keyword가 없으면 성생  
		else{
			url = baseUrl + "?keyword=" +keyword;
		}			

		// url 주소로 페이지 이동 
		location.href = url;
		
	});
	
	//필터 + 페이징 
	
	

	
})