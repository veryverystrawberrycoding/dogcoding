
$(function(){
	alert("start");
	
/*	var user_id = "a123";
	var pet_no = "2";
	var param = {"user_id":user_id, "pet_no":pet_no}
	$.ajax({
		anyne:true,
		type:'POST',
		data: param,
		url:"/mypageDogCare",
		dataType: "text",
		success : function(data) {
			alert("성공.");
			
		},
		error: function(textStatus, errorThrown) {
			alert("ERROR : " + textStatus + " : " + errorThrown);
		}
	});*/


var ctx = document.getElementById('myChart').getContext('2d');
var utilityChart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',
 
    // The data for our dataset
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
        datasets: [{
            label: '강아지 이름',
            fill: false,
            backgroundColor: '#537bc4',
            borderColor: '#537bc4',
            data: [0, 10, 5, 2, 20, 30, 45, 12, 41, 23, 12, 32]
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
                    beginAtZero:false,
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
})
