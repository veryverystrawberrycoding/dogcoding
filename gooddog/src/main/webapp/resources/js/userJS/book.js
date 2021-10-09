$(function(){
	
	function ajaxbookSearch(tag){
		$.ajax({
    		url: '/ajaxbookSearch',
    		data: {tag:tag},
			type: 'post',
			success: function(result){
				//alert('성공')
				bookList(result)
				
				}
			
			})
		
		
	}
	
	//검색버튼 이벤트 (해시태그, 글쓴이 검색)
	$('#book-search-btn').click(function(){

		var data = $('#data').val()
		//alert(data)
		ajaxbookSearch(data)

	})
	
	//갤러리 검색하기
/*	$('#book_search_form').submit(function(){
		var data = $('#data').val()
		//alert(data)
		ajaxbookSearch(data)
		

	})*/

		$('#hashtagsearch').ready(function(){

		var hashtagsearch = $('#hashtagsearch');
		
		
		var in1 = $('<a class="hashTag" id="hashTag"  style="cursor:pointer">#음식</a>');
		var in2 = $('<a class="hashTag" id="hashTag"  style="cursor:pointer">#건강</a>');
		var in3 = $('<a class="hashTag" id="hashTag"  style="cursor:pointer">#생활</a>');

					
					hashtagsearch.append(in1)
					hashtagsearch.append(in2)
					hashtagsearch.append(in3)

})
/////////////////////////////////////////////////////////////////
	$('#tagItem').ready(function(){
		
		var re = $('#tagItem').val().replace("[","  ").replace("]","").split(",")
		
	
		var tagList = $('#tagList');
		tagList.empty();
		var input;
		for (var i=0; i < re.length ; i++){
			input = $('<a href="/bookSearch?data='+re[i].replace("  ","")+'"><input type="button" value="'+"#"+re[i]+'" class="tags"/></a>');
			tagList.append(input)
		}
	})
//////////////////////하트/////////////////////
	///하트 클릭시
	$(document).on('click', '#bookheart', function(){
		var name = $(this).attr('src').replace("/resources/images/book/", "")
		var bookno = $('#bookno').val()
		
		if (name =='heart.png'){
		$(this).attr('src', $(this).attr('src').replace('heart','noheart')); //감소
		
		$.ajax({
		        type: "delete",
		        url: "/bookHeartDown",
		        data:{ bookno:bookno, userid:'a123'},
		        success: function(result) {
					$('#book_items2').empty();
				    var tag = $('#book_items2');
					var userlike = parseInt(result.userlike)
					var count =  '<a id="bookheart_text" class="bookheart_text" style="margin-left:5px" >'+result.dic_heart+'</a>'
					//alert(userlike)
					
					if (userlike == 0){
					var redheart =
					  '<img src="/resources/images/book/noheart.png" width="30px" height="30px"  id="bookheart">'
						tag.append(redheart+count)
					}
					else{
						var redheart = '<img src="/resources/images/book/heart.png" width="30px" height="30px"  id="bookheart">'				
						tag.append(redheart+count)
					}
					 
					 
		        }
		    });
		
		
		}
		else{
			$(this).attr('src', $(this).attr('src').replace('noheart','heart')); //증가
			$.ajax({
		        type: "put",
		        url: "/bookHeartUp",
		        data:{ bookno:bookno, userid:'a123'},
		        success: function(result) {
					$('#book_items2').empty();
				    var tag = $('#book_items2');
					var userlike = parseInt(result.userlike)
					var count =  '<a id="bookheart_text" class="bookheart_text" style="margin-left:5px" >'+result.dic_heart+'</a>'
					//alert(userlike)
					
					if (userlike == 0){
					var redheart =
					  '<img src="/resources/images/book/noheart.png" width="30px" height="30px"  id="bookheart">'
						tag.append(redheart+count)
					}
					else{
						var redheart = '<img src="/resources/images/book/heart.png" width="30px" height="30px"  id="bookheart">'				
						tag.append(redheart+count)
					}
					
		        }
		    });
			
		}

		
	})
	//하트클릭 끝
	
	//하트 옆 글씨(개수) 클릭시 하트도 눌림
	
	$('#bookheart_text').click(function(){
		$('#bookheart').click()


	})
	
	//좋아요 하트 옆에 글씨에 마우스
	$('#bookheart_text').hover(function(){
		$(this).css('color','#ed8e82')

	},function(){
		$(this).css('color','gray')

	})
	


	$('#book_submit_button').click(function(){
		
		var fileData = new FormData();
		fileData.append("file", $('#dic_img')[0].files[0]);
		
		$.ajax({
	        type: "POST",
	        url: "/bookimg",
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
/////////////////////////댓글//////////////////////////
	//댓글입력완료함 
	
	$('#comment_insert_btn').click(function(){
		var comment = $('#comment_insert').val()
		var bookno = $('#bookno').val()
		
		
		$.ajax({
	        type: "POST",
	        url: "/bookcommentInsert",
	        data: {comment:comment,bookno:bookno},
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
		
		var bookreno = $(this).next().val()
		//alert(bookreno)
		var bookno = $('#bookno').val()
		//alert(bookno)
		//alert(bookreno +'||'+ bookno)
		$.ajax({
	        type: "delete",
	        url: "/bookcommentDelete",
	        data: {bookreno:bookreno, bookno:bookno},
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
			comment += 	'<img src="/resources/images/book/delete.png" width="25px" height="25px" id="butbut">'
			comment +=  '<input type="hidden" value="'+commentList[i].bookre_no+'" id="bookreno">'
			comment += 	'</div>'
			}
			comment += 	'<img alt="img" src="/resources/images/userimg/'+commentList[i].user_img+'">'
			comment += 	'<h4>'+commentList[i].user_nick+'</h4>'
			comment += 	'<p class="small-text text-left color-main4">'+commentList[i].bookre_date+'</p>'
			comment += 	'</div>'
			comment += 	'</footer>'
			comment += 	'<div class="comment-content">'
			comment += 	'<p>'+commentList[i].bookre_content+'</p>'
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
		ajaxbookSearch(tag)
		
		
	})
	
	//게시글보기
	function bookList(result){
		
		var bookList = result.bookList

		$('#booklist').empty()
		var booktag=$('#booklist')
		
		var item = []		
		item +='<div class="row isotope-wrapper masonry-layout c-gutter-0" >'
		$.each(bookList, function(i){
		
		item += '<div class=" col-xl-4 col-md-6 training">'
		item +=	'<div class="vertical-item item-book content-absolute text-center ds">'
		item +=			'<div class="item-media">'
		item +=			'<img src="/resources/images/book/'+bookList[i].dic_img+'" href="bookView?dic_no='+bookList[i].dic_no+'">'
		item +=			'<div class="media-links">'
		item +=			'<div class="links-wrap">'								
		item +=			'<a class="link-zoom" ><br/>'+bookList[i].dic_heart+'</a>'
		item +=			'<a class="link-anchor" title="" href="bookView?dic_no='+bookList[i].dic_no+'"><br/>click</a>'
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
					booktag.append(item)

	}
	//게시글보기 끝
	
	//로그인 안했을 때 글쓰기버튼 누르면
    $('#book-btn-nosess').click(function(){
	
		//alert("dd")

		var result = confirm("로그인 후 이용하실 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
		if(result) {
			window.location.href = '/loginForm';

		}

	})
	
	//로그인 안했을 때 좋아요 누르면
	$(document).on('click', '#bookheart_nosess', function(){
		var result = confirm("로그인 후 이용하실 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
		if(result) {
			window.location.href = '/loginForm';
		}
	})

	
	
	
	
	///////////////////////////본인 게시글 삭제버튼 누르면
	$('#book_buttons2').click(function(){
	
		var result = confirm("게시글을 삭제하시겠습니까?");
		if(result) {
			var bookno = $('#bookno').val()
			
				$.ajax({
	       		 type: "POST",
	        		url: "/bookDelete",
	        		data:{ bookno:bookno},
	        		success: function(result) {
						window.location.href = '/bookList'
						alert(result)
					}

	    	});
		}

	})
		

	
	
	//댓글 페이징
	$(document).on('click', '#pnum', function(){
		var pnum = $(this).text().trim()
		//alert(pnum)
		var bookno = $('#bookno').val()
		ajaxcommentPaging(pnum,bookno)
		
		})
		//댓글 페이징 끝
		

	$(document).on('click', '#p_pre', function(){
		var pnum = 1
		//alert(pnum)
		var bookno = $('#bookno').val()
		ajaxcommentPaging(pnum,bookno)
	})
	
	$(document).on('click', '#p_next', function(){
		var count = parseInt($('#commentcount').text().trim().replace("댓글 ","").replace("개",""))
		//alert(count)
		var bookno = $('#bookno').val()
		var pnum
		if(count%5 == 0) {
			pnum = count/5;
		}
		else {
			pnum = parseInt(count/5)+1; //페이지 수
		}
		//alert(pnum)
		
		ajaxcommentPaging(pnum,bookno)
	})

	function ajaxcommentPaging(pnum,bookno){
		
		$.ajax({
	       		 	type: "POST",
	        		url: "/ajaxbookcommentselect",
	        		data:{ pnum:pnum, bookno:bookno},
	        		success: function(result) {
						commentView(result)
					}

			})
	}
	
});