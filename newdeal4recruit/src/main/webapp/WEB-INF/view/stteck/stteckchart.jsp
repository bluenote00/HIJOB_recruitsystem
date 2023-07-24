<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Q&A게시판</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>


<!-- chart import -->
<script type="text/javascript" src="${CTX_PATH}/js/apexcharts/apexcharts.js"></script>

<!-- chart import css-->
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/apexcharts/apexcharts.css">

<!-- font awesome css -->
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/js/statistics/css/font-awesome.min.css">

<style>

#container ul li.contents {padding:0 20px;background:#fff; width:800px;}
#container ul li.contents .content {padding-top:16px;margin-bottom:20px; width:800px;height:1000px;}

#wrap_area {
   position: relative;
}

</style>


<script type="text/javascript">

$(function() {

	// 세가지 차트에 쓸 데이터 가져오기
	fChartData();
	
});

function fChartData(){
	
	//let todayDate = new Date();
	
	//let today = todayDate.toLocaleDateString();
	
	var resultCallback = function(data) {
		
		fCompanyTopChart(data.chartData.companyDTOList);
		
		fProductTopChart(data.chartData.profitDTOList);
		
		fSalesLineChart(data.chartData.productDTOList);
	};
	
	callAjax("/stteck/chart", "post", "json", true, null, resultCallback);
	
}
 
function fSalesLineChart(data){
	
	var profit = new Array();
	profit = data;
    
    var options = {
      series: [{
        name: "합격자 수",
        data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
    }],
      chart: {
      height: 350,
      type: 'bar',
      zoom: {
        enabled: false
      }
    },
    dataLabels: {
      enabled: false
    },
    stroke: {
      curve: 'straight'
    },
    grid: {
      row: {
        colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
        opacity: 0.5
      },
    },
    xaxis: {
      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
    }
    };

	options.series[0].data = [];
	options.xaxis.categories = [];
    
	for(var i = 0; i< profit.length; i++){
		options.series[0].data.push(profit[i].appli_no);
		options.xaxis.categories.push(profit[i].user_coname);
	}
	
	
    var chart = new ApexCharts(document.querySelector("#applypassChart"), options);
    chart.render();
}
 
function fProductTopChart(data){
	
	var product = new Array();
	
	product = data;
	
	var unstsearch = true;
	//차트 옵션
	var options = {
            series: [],
            chart: {
            width: 430,
            type: 'pie',
            toolbar: {
                show: true,
                offsetX: 0,
                offsetY: 0,
                tools: {
                  download: true | '<i class="fas fa-cloud-download-alt" width="20"></i>',
                  selection: true,
                  zoom: true,
                  zoomin: true,
                  zoomout: true,
                  pan: true,
                  reset: true | '<i class="fas fa-redo-alt" width="20"></i>',
                  customIcons: []
                },
                export: {
                  csv: {
                    filename: undefined,
                    columnDelimiter: ',',
                    headerCategory: 'category',
                    headerValue: 'value',
                    dateFormatter(timestamp) {
                      return new Date(timestamp).toDateString()
                    }
                  }
                },
                autoSelected: 'zoom' 
              },
	
          },
          labels: [],
          };
	
	
	options.series = [];
	options.labels = [];
	
	for(var i = 0; i< product.length; i++){
		options.series.push(product[i].session_code);
		options.labels.push(product[i].applycnt);
	}
	
	// div 비운 뒤 에이펙스 차트 렌더링
	//document.querySelector("#chart").innerHTML = ' ';
	var chart = new ApexCharts(document.querySelector("#applysessionChart"), options);
	chart.render();
	
} 
 
function fCompanyTopChart(data) {

	var company = new Array();
	
	company = data;
	
    var options = {
      series: [{
    	  name:'참가횟수',
      data: [44, 55, 41, 67, 22, 43, 21, 33, 45, 31, 87, 65, 35]
    }],
    chart: {
      height: 350,
      type: 'bar',
    },
    plotOptions: {
      bar: {
        columnWidth: '50%',
        endingShape: 'rounded'  
      }
    },
    dataLabels: {
      enabled: false
    },
    stroke: {
      width: 2
    },
    
    grid: {
      row: {
        colors: ['#fff', '#f2f2f2']
      }
    },
    xaxis: {
      labels: {
        rotate: -45
      },
      categories: ['Apples', 'Oranges', 'Strawberries', 'Pineapples', 'Mangoes', 'Bananas',
        'Blackberries', 'Pears', 'Watermelons', 'Cherries', 'Pomegranates', 'Tangerines', 'Papayas'
      ],
      tickPlacement: 'on'
    },
    fill: {
      type: 'gradient',
      gradient: {
        shade: 'light',
        type: "horizontal",
        shadeIntensity: 0.25,
        gradientToColors: undefined,
        inverseColors: true,
        opacityFrom: 0.85,
        opacityTo: 0.85,
        stops: [50, 0, 100]
      },
    },
    toolbar: {
        show: true,
        offsetX: 0,
        offsetY: 0,
        tools: {
          download: true | '<i class="fas fa-cloud-download-alt" width="20"></i>',
          selection: true,
          zoom: true,
          zoomin: true,
          zoomout: true,
          pan: true,
          reset: true | '<i class="fas fa-redo-alt" width="20"></i>',
          customIcons: []
        },
        export: {
          csv: {
            filename: undefined,
            columnDelimiter: ',',
            headerCategory: 'category',
            headerValue: 'value',
            dateFormatter(timestamp) {
              return new Date(timestamp).toDateString()
              
            }
          }
        },
        autoSelected: 'zoom' 
      },
    };

	options.series[0].data = [];
	options.xaxis.categories = [];
	
	for(var i = 0; i< company.length; i++){
		options.series[0].data.push(company[i].total_cntcop);
		options.xaxis.categories.push(company[i].user_coname);
	}
	
	
    var chart = new ApexCharts(document.querySelector("#companyChart"), options);
    chart.render();
}







</script>
</head>
<body>




	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">행사</span> <span class="btn_nav bold">행사통계현황
								</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>




				<p class="conTitle" style="margin-top: 1%">
					<span>회차별 지원자수 통계</span> <span class="fr"> 
					</span>
				</p>

		<div id="applysessionChart" class="canvas" style="height:300px; width:90%"></div>
		



				<p class="conTitle" style="margin-top: 1%">
					<span>회차별 참여기업 통계</span> <span class="fr"> 
					</span>
				</p>



		<div id="companyChart" class="first" style="height:300px; width:90%"></div>

	
				<p class="conTitle" style="margin-top: 1%">
					<span>기업 별 합격자수 통계</span> <span class="fr"> 
					</span>
				</p>

		<div id="applypassChart" class="canvas" style="height:300px; width:90%"></div>
		
	
	
	
	
<!-- 		<canvas id=companyTopChart class="first" style="height:300px; width:50%"></canvas>
 -->
	<!-- 	<canvas id=productTopChart class="third" style="height:300px; width:45%"></canvas>
 -->

		<div id="chart" style="width:40%;float:right;"></div>	
		
		
		<div id="beforeInit" style="height:400px;"></div>

</body>
</html>