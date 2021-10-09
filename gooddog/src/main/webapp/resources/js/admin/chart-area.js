	
var dayCount = $('#dayCount').val();
 dayCount = dayCount.replace(/{/g,'');
 dayCount = dayCount.replace(/}/g,'');
 dayCount = dayCount.replace(/\[/g,'');
 dayCount = dayCount.replace(/\]/g,'');

const obj = JSON.stringify(dayCount);
const obj_Json = JSON.parse(obj);

const spObj = obj_Json.split(",");

var fullCount = spObj.length ;
var fullLabel;
var fullData;

var data = spObj[9];


var array_label = [];


var array_data = [];

for(var i=0; i<fullCount; i++){
	
	var label = spObj[i];
	var data = spObj[i+1];
	
	var labelS = label.split("=");
	var dataS = data.split("=");
//	alert("데이터확인 "+i+":::::::::::::::::::"+labelS[1]);
	
	
	array_data[i] = labelS[1];
	array_label[i] = dataS[1];	
	
	i++;
	
};

	
//alert(fullData);




// logno=21, userlog=2021-09-26,
// logno=21, userlog=2021-09-27, 
// logno=20, userlog=2021-09-28, logno=16, userlog=2021-09-30, logno=10, userlog=2021-10-01

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
