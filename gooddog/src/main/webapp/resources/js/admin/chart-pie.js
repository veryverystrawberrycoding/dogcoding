
// Pie Chart Example


var ctx = document.getElementById("myPieChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ["남자 회원", "여자 회원"],
        datasets: [{

 		
            data: ['${menCount}', '${womenCount}'], //컨트롤러에서 모델로 받아온다.
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)'

            ],
              backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745','#9370db'],
			
   }],
  },
});



 