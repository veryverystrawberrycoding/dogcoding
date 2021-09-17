// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

var maxvalue2 = Math.max(
	  $('#monthsum6').val(),
  	  $('#monthsum5').val(),
  	  $('#monthsum4').val(),
  	  $('#monthsum3').val(),
  	  $('#monthsum2').val(),
  	  $('#monthsum1').val()    	);
	var minvalue2 = Math.min(
      $('#monthsum6').val(),
	  $('#monthsum5').val(),
	  $('#monthsum4').val(),
	  $('#monthsum3').val(),
	  $('#monthsum2').val(),
	  $('#monthsum1').val()   	);
	alert(maxvalue2+ " , " + minvalue2);
// 최근 6개월 값
// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: [
    	$('#month6').val()+"월",
    	$('#month5').val()+"월",
    	$('#month4').val()+"월",
    	$('#month3').val()+"월",
    	$('#month2').val()+"월",
    	$('#month1').val()+"월"],
    datasets: [{
      label: "Revenue",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: [    	  
    	  $('#monthsum6').val(),
    	  $('#monthsum5').val(),
    	  $('#monthsum4').val(),
    	  $('#monthsum3').val(),
    	  $('#monthsum2').val(),
    	  $('#monthsum1').val()],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 6
        }
      }],
      yAxes: [{
        ticks: {
          min: minvalue2,
          max: maxvalue2,
          maxTicksLimit: 6
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});


