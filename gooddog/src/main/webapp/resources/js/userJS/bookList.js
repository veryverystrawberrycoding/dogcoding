$(function(){
	
	
	// 필터 선택부분에 마우스 가져가면
	$(document).on('mouseenter', '#filter', function(){
		$(this).css('color','#54c1c4')
		$(this).css('cursor','pointer')
	})
	
	//필터 선택부분으로부터 멀어지면
	$(document).on('mouseleave', '#filter', function(){
		$(this).css('color','gray')
	})
	
	//필터 클릭
	$(document).on('click', '#filter', function(){
		var filter = $(this).text()
		//alert(filter)
		
		$.ajax({
    		url: '/ajaxBookFilter',
    		data: {filter:filter},
			type: 'post',
			success: function(result){
				//alert('성공')
				var bookList = result.bookList
				bookListappend(bookList)
				
				}
			
			})
		
	})
	
	$('#search-btn').click(function(){

		var data = $('#data').val()
		//alert(data)
		
		$.ajax({
    		url: '/ajaxBookSearch',
    		data: {data:data},
			type: 'post',
			success: function(result){
				//alert('성공')
				var bookList = result.bookList
				bookListappend(bookList)
				
				}
			
			})
		
	})
	
	function bookListappend(bookList){
	
		$('#here').empty()
		var here = $('#here');
		content =[]
				
		content +='<div class="row isotope-wrapper masonry-layout c-mb-30">'
				
		$.each(bookList, function(i){
					content +='<div class="col-md-4 life">'
									
					content +='<div class="vertical-item text-center content-padding box-shadow">'
					content +='<div class="item-media">'
					content +='<img style="width:300px; height:300px;" src="/resources/images/book/'+bookList[i].dic_img+'" alt="img">'
												
					content +='<div class="media-links">'
					content +='<a class="abs-link" title="" href="bookView?no='+bookList[i].dic_no+'"></a>'
					content +='</div>'
					content +='</div>'
					content +='<div class="item-content">'						
					content +='<p> '+bookList[i].dic_name+'</p>'
					content +='</div></div></div>'
				
		})
		content +='</div>'
		here.append(content)
	}
	
});