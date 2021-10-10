
var weekCount = $('#weekCount').val();
 weekCount = weekCount.replace(/{/g,'');
 weekCount = weekCount.replace(/}/g,'');
 weekCount = weekCount.replace(/\[/g,'');
 weekCount = weekCount.replace(/\]/g,'');

// dayCount에 값을 json 형식으로 변환한다
const obj2 = JSON.stringify(weekCount);
const obj_Json2 = JSON.parse(obj2);
const spObj2 = obj_Json2.split(",");

//변수의 길이
var fullCount2 = spObj2.length;
var fullLabel2;
var fullData2;
var data2 = spObj2[9];
var array_label2 = [];
var array_data2 = [];

for(var i=0; i<fullCount2; i++){
	// 방문자수 값
	var label2 = spObj2[i];
	// 날짜 값
	var data2 = spObj2[i+1];
	var labelS2 = label2.split("=");
	var dataS2 = data2.split("=");

	array_data2[i] = labelS2[1];
	array_label2[i] = dataS2[1];	

	i++;
	
};
new Chart(document.getElementById("myBarChart"), {
    type: 'bar',
    data: {
      labels: array_label2,
      datasets: [
        {
          label: ["월별 방문자"],
          backgroundColor: 	'#87CEFA',
          data: array_data2
  		 
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