$(function(){
	
	function ajaxgalSearch(tag){
		$.ajax({
    		url: '/ajaxgalSearch',
    		data: {tag:tag},
			type: 'post',
			success: function(result){
				//alert('성공')
				galleryList(result)
				
				}
			
			})
		
		
	}
	
	//검색버튼 이벤트 (해시태그, 글쓴이 검색)
	$('#gal-search-btn').click(function(){

		var data = $('#data').val()
		//alert(data)
		ajaxgalSearch(data)

	})
	
	//갤러리 검색하기
/*	$('#gallery_search_form').submit(function(){
		var data = $('#data').val()
		//alert(data)
		ajaxgalSearch(data)
		

	})*/

	
	$('#hashtagsearch').ready(function(){

		var hashtagsearch = $('#hashtagsearch');
		
		
		var in1 = $('<a class="hashTag" id="hashTag"  style="cursor:pointer">#강아지</a>');
		var in2 = $('<a class="hashTag" id="hashTag"  style="cursor:pointer">#멍스타그램</a>');
		var in3 = $('<a class="hashTag" id="hashTag"  style="cursor:pointer">#댕댕이</a>');
		var in4 = $('<a class="hashTag" id="hashTag"  style="cursor:pointer">#반려견</a>');
		var in5 = $('<a class="hashTag" id="hashTag"  style="cursor:pointer">#멍멍이</a>');
					
					hashtagsearch.append(in1)
					hashtagsearch.append(in2)
					hashtagsearch.append(in3)
					hashtagsearch.append(in4)
					hashtagsearch.append(in5)
	
		/*$.ajax({
		        type : 'GET',                             
		        url : ' http://127.0.0.1:5000/tag',
		        success : function(result){
			
					var hashtagsearch = $('#hashtagsearch'); 
//					var in1 = $('<a class="hashTag" id="hashTag" style="cursor:pointer">#'+result.num1+'</a>');
//					var in2 = $('<a class="hashTag" id="hashTag" style="cursor:pointer">#'+result.num2+'</a>');
//					var in3 = $('<a class="hashTag" id="hashTag" style="cursor:pointer">#'+result.num3+'</a>');
//					var in4 = $('<a class="hashTag" id="hashTag" style="cursor:pointer">#'+result.num4+'</a>');
//					var in5 = $('<a class="hashTag" id="hashTag" style="cursor:pointer">#'+result.num5+'</a>');
					
					
					hashtagsearch.append(in1)
					hashtagsearch.append(in2)
					hashtagsearch.append(in3)
					hashtagsearch.append(in4)
					hashtagsearch.append(in5)
					
					}
		
				
		})*/
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
	$(document).on('click', '#galheart', function(){
		var name = $(this).attr('src').replace("/resources/images/gallery/", "")
		var galno = $('#galno').val()
		
		if (name =='heart.png'){
		$(this).attr('src', $(this).attr('src').replace('heart','noheart')); //감소
		
		$.ajax({
		        type: "delete",
		        url: "/galHeartDown",
		        data:{ galno:galno, userid:'a123'},
		        success: function(result) {
					$('#gallery_items2').empty();
				    var tag = $('#gallery_items2');
					var userlike = parseInt(result.userlike)
					var count =  '<a id="galheart_text" class="galheart_text" style="margin-left:5px" >'+result.gal_heart+'</a>'
					//alert(userlike)
					
					if (userlike == 0){
					var redheart =
					  '<img src="/resources/images/gallery/noheart.png" width="30px" height="30px"  id="galheart">'
						tag.append(redheart+count)
					}
					else{
						var redheart = '<img src="/resources/images/gallery/heart.png" width="30px" height="30px"  id="galheart">'				
						tag.append(redheart+count)
					}
					 
					 
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
					$('#gallery_items2').empty();
				    var tag = $('#gallery_items2');
					var userlike = parseInt(result.userlike)
					var count =  '<a id="galheart_text" class="galheart_text" style="margin-left:5px" >'+result.gal_heart+'</a>'
					//alert(userlike)
					
					if (userlike == 0){
					var redheart =
					  '<img src="/resources/images/gallery/noheart.png" width="30px" height="30px"  id="galheart">'
						tag.append(redheart+count)
					}
					else{
						var redheart = '<img src="/resources/images/gallery/heart.png" width="30px" height="30px"  id="galheart">'				
						tag.append(redheart+count)
					}
					
		        }
		    });
			
		}

		
	})
	//하트클릭 끝
	
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
	          //alert(result)
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
	         
				commentView(result)
	        }
	    });
	})

	//댓글입력 끝
	//댓글삭제
	$(document).on('click', '#comment_delete_btn > #butbut', function(){
		
		var q = confirm("댓글을 삭제하시겠습니까?");
		if(q) {
		
		var galreno = $(this).next().val()
		//alert(galreno)
		var galno = $('#galno').val()
		//alert(galno)
		//alert(galreno +'||'+ galno)
		$.ajax({
	        type: "delete",
	        url: "/commentDelete",
	        data: {galreno:galreno, galno:galno},
	        //dataType: "json",
			//contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	     
	        success: function(result) {
	         
			  commentView(result)
				alert('댓글을 삭제했습니다.')
	        }
	    });
	}//if문 끝


	
	});
	//댓글삭제끝
	
	//댓글보기
	function commentView(result){
		//alert(result.count)
		//count
		$('#commentcount').empty()
		var tag = $('#commentcount')
		var count = '<h4>댓글 '+ result.count+'개</h4>'
		tag.append(count)
		
		//commentList
		var commentList = result.commentList

		$('#commentList').empty()
		var comtag=$('#commentList')
		
		var comment = []
		
		var userid = $('#userid').val() //현재 세션 id
		
		//댓글리스트
		$.each(commentList, function(i){
			
			comment += '<article class="comment-body">'
			comment += '<footer class="comment-meta">'
			comment += '<div class="comment-author vcard">'
			if(userid == commentList[i].user_id ){
			
			comment += 	'<div class="comment_delete_btn" id="comment_delete_btn">'
			comment += 	'<img src="/resources/images/gallery/delete.png" width="25px" height="25px" id="butbut">'
			comment +=  '<input type="hidden" value="'+commentList[i].galre_no+'" id="galreno">'
			comment += 	'</div>'
			}
			comment += 	'<img alt="img" src="/resources/images/profile/'+commentList[i].user_img+'">'
			comment += 	'<h4>'+commentList[i].user_nick+'</h4>'
			comment += 	'<p class="small-text text-left color-main4">'+commentList[i].galre_date+'</p>'
			comment += 	'</div>'
			comment += 	'</footer>'
			comment += 	'<div class="comment-content">'
			comment += 	'<p>'+commentList[i].galre_content+'</p>'
			comment += 	'</div>'
			comment += 	'</article>'
					})
				
			comtag.append(comment)
			
			//페이징부분
			$('#page').empty()
			var ptag = $('#page')
			var paging=[]
			var pnum = result.page //페이지 수
			
				paging += '<nav aria-label="Pagination">'
				paging += '<ul class="pagination">'
				paging += '<li class="page-item">'
				paging += '<a class="page-link" id="p_pre">'
				paging += '<i class="fa fa-chevron-left"></i>'
				paging += '</a>'
				paging += '</li>'

				for(var i = 1; i <= pnum; i++){

					paging +='<li class="page-item">'
					paging +='<a class="page-link" id="pnum">'+i+'</a>'					
					paging +='</li>'
				}
				paging += '<li class="page-item">'
				paging +='<a class="page-link" id="p_next">'
				paging +='<i class="fa fa-chevron-right"></i>'
				paging +='</a>'
				paging +='</li>'
				paging +='</ul>'
				paging +='</nav>'
			ptag.append(paging)

	}
	//댓글보기 끝
	
	//검색창 아래 해시태그 클릭이벤트
	
	$('#hashtagsearch').on('click','a',function(){
		var tag = $(this).text().replace("#","")
		
		//alert(tag)
		ajaxgalSearch(tag)
		
		
	})
	
	//게시글보기
	function galleryList(result){
		
		var galList = result.galList

		$('#gallist').empty()
		var galtag=$('#gallist')
		
		var item = []		
		item +='<div class="row isotope-wrapper masonry-layout c-gutter-0" >'
		$.each(galList, function(i){
		
		item += '<div class=" col-xl-4 col-md-6 training">'
		item +=	'<div class="vertical-item item-gallery content-absolute text-center ds">'
		item +=			'<div class="item-media">'
		item +=			'<img src="/resources/images/gallery/'+galList[i].gal_img+'" href="galleryView?gal_no='+galList[i].gal_no+'">'
		item +=			'<div class="media-links">'
		item +=			'<div class="links-wrap">'								
		item +=			'<a class="link-zoom" ><br/>'+galList[i].gal_heart+'</a>'
		item +=			'<a class="link-anchor" title="" href="galleryView?gal_no='+galList[i].gal_no+'"><br/>click</a>'
		item +=			'</div>'
		item +=			'</div>'
		item +=			'</div>'
		item +=			'</div>'
		item +=			'</div>'
					})
					item +='</div>'
					
					if(result.num < result.page){
						item +='<div class="row mt-60">'
						item +='<div class="col-sm-12 text-center">'
						item +='<a class="btn btn-maincolor mb-0" id="viewmore" style="color:white">View More</a>'
						item +='<input type="hidden" value="'+result.num+'" id="num">'
						item +='<input type="hidden" value="'+result.tag+'" id="tag">'
						item +='</div>'
						item +='</div>'
					}
					galtag.append(item)
	}
	//게시글보기 끝
	
	//로그인 안했을 때 글쓰기버튼 누르면
    $('#gallery-btn-nosess').click(function(){
	
		//alert("dd")

		var result = confirm("로그인 후 이용하실 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
		if(result) {
			window.location.href = '/loginForm';

		}

	})
	
	//로그인 안했을 때 좋아요 누르면
	$(document).on('click', '#galheart_nosess', function(){
		var result = confirm("로그인 후 이용하실 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
		if(result) {
			window.location.href = '/loginForm';
		}
	})

	
	
	//로그인 안했을 때 신고버튼 누르면
	 $('#gallery_buttons3_nosess').click(function(){
	
		//alert("dd")

		var result = confirm("로그인 후 이용하실 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
		if(result) {
			window.location.href = '/loginForm';
		}

	})
	
	//로그인 했을 때 신고버튼 누르면
	$('#gallery_buttons3').click(function(){
	
		var result = confirm("게시글을 신고하시겠습니까?");
		if(result) {
			var galno = $('#galno').val()
			
				$.ajax({
	       		 type: "POST",
	        		url: "/badContent",
	        		data:{ galno:galno},
	        		success: function(result) {
						window.location.href = '/galleryView?gal_no='+galno
						alert(result)
					}

	    	});
		}

	})
	
	//본인 게시글 삭제버튼 누르면
	$('#gallery_buttons2').click(function(){
	
		var result = confirm("게시글을 삭제하시겠습니까?");
		if(result) {
			var galno = $('#galno').val()
			
				$.ajax({
	       		 type: "POST",
	        		url: "/galDelete",
	        		data:{ galno:galno},
	        		success: function(result) {
						window.location.href = '/galleryList'
						alert(result)
					}

	    	});
		}

	})
	
	
	//뷰모어(갤러리리스트 페이징)
		
	$(document).on('click', '#viewmore', function(){
		var num = $('#num').val();
		var tag = $('#tag').val();
		//alert(num)
		$.ajax({
	       		 	type: "POST",
	        		url: "/ajaxgalselect",
	        		data:{ num:num, tag:tag},
	        		success: function(result) {
						galleryList(result)
					}

			})
		
	})
	
	
	//댓글 페이징
	$(document).on('click', '#pnum', function(){
		var pnum = $(this).text().trim()
		//alert(pnum)
		var galno = $('#galno').val()
		ajaxcommentPaging(pnum,galno)
		
		})
		//댓글 페이징 끝
		

	$(document).on('click', '#p_pre', function(){
		var pnum = 1
		//alert(pnum)
		var galno = $('#galno').val()
		ajaxcommentPaging(pnum,galno)
	})
	
	$(document).on('click', '#p_next', function(){
		var count = parseInt($('#commentcount').text().trim().replace("댓글 ","").replace("개",""))
		//alert(count)
		var galno = $('#galno').val()
		var pnum
		if(count%5 == 0) {
			pnum = count/5;
		}
		else {
			pnum = parseInt(count/5)+1; //페이지 수
		}
		//alert(pnum)
		
		ajaxcommentPaging(pnum,galno)
	})

	function ajaxcommentPaging(pnum,galno){
		
		$.ajax({
	       		 	type: "POST",
	        		url: "/ajaxcommentselect",
	        		data:{ pnum:pnum, galno:galno},
	        		success: function(result) {
						commentView(result)
					}

			})
	}
	
});