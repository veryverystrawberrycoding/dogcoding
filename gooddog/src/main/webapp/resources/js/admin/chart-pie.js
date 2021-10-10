// 성별 차트 

var menCount = $('#menCount').val();
var womenCount = $('#womenCount').val();

var ctx = document.getElementById("myPieChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ["남자 회원", "여자 회원"],
        datasets: [{
			data: [menCount, womenCount], //컨트롤러에서 모델로 받아온다.
            backgroundColor: [
                '#3e95cd','	#DB7093'

            ],
   }],
  },	
});



 