	
var dayCount = $('#dayCount').val();
 dayCount = dayCount.replace(/{/g,'');
 dayCount = dayCount.replace(/}/g,'');
 dayCount = dayCount.replace(/\[/g,'');
 dayCount = dayCount.replace(/\]/g,'');

// dayCount에 값을 json 형식으로 변환한다
const obj = JSON.stringify(dayCount);
const obj_Json = JSON.parse(obj);
const spObj = obj_Json.split(",");

//변수의 길이
var fullCount = spObj.length ;
var fullLabel;
var fullData;
var data = spObj[9];
var array_label = [];
var array_data = [];

for(var i=0; i<fullCount; i++){
	// 방문자수 값
	var label = spObj[i];
	// 날짜 값
	var data = spObj[i+1];
	
	var labelS = label.split("=");
	var dataS = data.split("=");
//	alert("데이터확인 "+i+":::::::::::::::::::"+labelS[1]);

	array_data[i] = labelS[1];
	array_label[i] = dataS[1];	
	
	i++;
	
};

new Chart(document.getElementById("myAreaChart"), {
  type: 'bar',
  data: {
    labels: array_label,
    datasets: [{ 
        data : array_data,
        label: '일별 방문자',
        borderColor: "#3e95cd",
		backgroundColor: "#FFC0CB",
        fill: false
      }
    ]
  },
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
                    beginAtZero:true,
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
