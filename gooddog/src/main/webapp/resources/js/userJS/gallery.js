$(function(){
	
	//검색버튼 이벤트
	$('#gal-search-btn').click(function(){
		
		$('#gallery_search_form').submit()
	})
	
	//검색창아래 해시태그 (파이썬 연동)
	
	$('#hashtagsearch').ready(function(){
	
		$.ajax({
		        type : 'GET',                             
		        url : ' http://127.0.0.1:5000/tag',
		        success : function(result){
			
					var hashtagsearch = $('#hashtagsearch'); //href="/galSearch?data='+result.num4+'
					var in1 = $('<a class="hashTag" id="hashTag" href="/galSearch?data='+result.num1+'" style="cursor:pointer">#'+result.num1+'</a>');
					var in2 = $('<a class="hashTag" id="hashTag" href="/galSearch?data='+result.num2+'" style="cursor:pointer">#'+result.num2+'</a>');
					var in3 = $('<a class="hashTag" id="hashTag" href="/galSearch?data='+result.num3+'" style="cursor:pointer">#'+result.num3+'</a>');
					var in4 = $('<a class="hashTag" id="hashTag" href="/galSearch?data='+result.num4+'" style="cursor:pointer">#'+result.num4+'</a>');
					var in5 = $('<a class="hashTag" id="hashTag" href="/galSearch?data='+result.num5+'" style="cursor:pointer">#'+result.num5+'</a>');
					
					hashtagsearch.append(in1)
					hashtagsearch.append(in2)
					hashtagsearch.append(in3)
					hashtagsearch.append(in4)
					hashtagsearch.append(in5)
					
					}
		
				
		})
	})
	
	//게시글 상세 해시태그
	
	$('#tagItem').ready(function(){
		
		var re = $('#tagItem').val().replace("[","  ").replace("]","").split(",")
		
	
		var tagList = $('#tagList');
		tagList.empty();
		var input;
		for (var i=0; i < re.length ; i++){
			input = $('<a href="/galSearch?data='+re[i].replace("  ","")+'"><input type="button" value="'+"#"+re[i]+'" class="tags"/></a>');
			tagList.append(input)
		}
	})

	//하트 클릭시
	
	$('#galheart').click(function(){
		//alert('하투')
		var name = $(this).attr('src').replace("/resources/images/gallery/", "")
		var galno = $('#galno').val()
		
		if (name =='heart.png'){
		$(this).attr('src', $(this).attr('src').replace('heart','noheart')); //감소
		
		$.ajax({
		        type: "delete",
		        url: "/galHeartDown",
		        data:{ galno:galno, userid:'a123'},
		        success: function(result) {
		          alert(result)
		        }
		    });
		
		
		}
		else{
			$(this).attr('src', $(this).attr('src').replace('noheart','heart')); //증가
			$.ajax({
		        type: "put",
		        url: "/galHeartUp",
		        data:{ galno:galno, userid:'a123'},
		        success: function(result) {
		          alert(result)
		        }
		    });
			
		}
		
	})
	
	//하트 옆 글씨(개수) 클릭시 하트도 눌림
	
	$('#galheart_text').click(function(){
		$('#galheart').click()


	})
	
	//좋아요 하트 옆에 글씨에 마우스
	$('#galheart_text').hover(function(){
		$(this).css('color','#ed8e82')

	},function(){
		$(this).css('color','gray')

	})
	
	//검색창 아래 해시태그 클릭이벤트
	/*
	$('#hashtagsearch').on('click','a',function(){
		var tag = $(this).text().replace("#","")
		
		//alert(tag)
		$.ajax({
	        type: "POST",
	        url: "/ajaxgalSearch",
	        data:{ tag:tag},
	        success: function(result) {
	          alert(result)
	        }
	    });
		
		
	})*/


	$('#gallery_submit_button').click(function(){
		
		
		var fileData = new FormData();
		fileData.append("file", $('#gal_img')[0].files[0]);
		
		$.ajax({
	        type: "POST",
	        url: "/galimg",
	        data: fileData,
	        enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
	        dataType: "json",
	        cache : false,
	        success: function(result) {
	          alert(result)
	        }
	    });


	});
	
	//댓글입력
	
	$('#comment_insert_btn').click(function(){
		var comment = $('#comment_insert').val()
		var galno = $('#galno').val()
		
		
		$.ajax({
	        type: "POST",
	        url: "/commentInsert",
	        data: {comment:comment,galno:galno},
	        //dataType: "json",
			//contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	     
	        success: function(result) {
	          alert(result)
				commentView(galno)
	        }
	    });
	})

	//댓글입력 끝
	//댓글삭제
	$(document).on('click', '#comment_delete_btn > #butbut', function(){
		var galreno = $(this).next().val()
		var galno = $('#galno').val()
		$.ajax({
	        type: "delete",
	        url: "/commentDelete",
	        data: {galreno:galreno},
	        //dataType: "json",
			//contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	     
	        success: function(result) {
	          alert(result)
			  commentView(galno)
	        }
	    });


	
	});//댓글삭제끝
	
	//댓글보기
	function commentView(galno){
		$.ajax({
			type: 'get',
			url: '/commentShow/' + galno,
			success: function(result){
				alert(result)
			}
		})
	}
	//댓글보기 끝
	
});