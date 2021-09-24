$(function(){
	
	$('#galheart').click(function(){
		//alert('하투')
		var name = $(this).attr('src').replace("/resources/images/gallery/", "")
		if (name =='heart.png'){
		$(this).attr('src', $(this).attr('src').replace('heart','noheart'));
		}
		else{
			$(this).attr('src', $(this).attr('src').replace('noheart','heart'));
		}
		
	})
	
});