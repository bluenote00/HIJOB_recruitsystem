<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="X-UA-Compatible" content="ie=chrome">
<title>하이잡</title>
 
<link rel="icon" type="image/png" href="../images/home/smile.png">
<style>

#container ul li.contents {padding:0 20px;background:#fff; width:800px;}

#wrap_area {
	position: relative;
}

#adver_recruit_all {
	padding-top: 20px;
	padding-bottom: 20px;
}

#main_blank {
	padding-top: 200px;
	padding-bottom: 200px;
}

#main_blank2 {
	padding-top: 400px;
	padding-bottom: 400px;
}


.adver_recruit_explain {
    padding-top: 50px;
    padding-bottom: 20px;
    padding-left: 30px;
    padding-right: 30px;
    line-height: 28px;
}

.adver_recruit_explain h3 {
    padding-bottom: 3px;
    font-size: 20px;
    color: rgb(0, 0, 0);
    line-height: 25px;
    letter-spacing: -0.5px;
    font-weight: bold;
}

.wirter_tag {
    color: #4d4d4d;
    font-size: 16px;
}

.recruit_head h1 {
    font-weight: 700;
    font-size: 40px;
    padding-bottom: 15px;
    line-height: 1.25;
}

.recruit_company {
    padding-bottom: 20px;
}

.recruit_calendar, .recruit_skillstack,
.recruit_mainwork, .recruit_qualify, .recruit_preference, .recruit_welfare, .recruit_map {
    padding-bottom: 60px;
}

.recruit_period, .skill_icon, .recruit_detail, #recruit_mapapi, .recruit_introduce_img, .recruit_introduce_detail  {
    padding-left: 20px;
    padding-right: 30px;
}

.skill_icon {
	display: flex;
}


#recruit_mapapi {
 	width:350px;
 	height:350px;
 	padding-left:20px;
}

.recruit_detail p {
	padding-bottom: 15px;
}

.recruit_period, .recruit_ul_list, .recruit_detail, #recruit_mapapi, .recruit_introduce_detail {
    font-size: 16px;
    word-break: break-all;
}

.adver_recruit_explain i {
	    font-size: 19px;
	    color: #1751a8;
}

.recruit_mapapi {
	padding-top: 10px;
}

.recruit_introduce_img img {
    width: 700px;
    height: 450px;
    border-radius: 10px;
}

.adver_recruit_introduce {
	   padding-left: 30px;
	   line-height: 28px;
	   padding-bottom: 60px;	   
}

.adver_recruit_introduce h3 {
    padding-bottom: 10px;
    font-size: 20px;
    color: rgb(0, 0, 0);
    line-height: 25px;
    letter-spacing: -0.5px;
    font-weight: bold;
}

.recruit_introduce_detail {
    padding-top: 20px;
    padding-bottom: 50px;
    padding-right: 40px;
}

.skill_button {
    border-radius: 20px 20px 20px 20px;
    font-size: 14px;
    border-color: rgb(244, 244, 244);
    background-color: rgb(244, 244, 244);
    border-width: thin;
    padding-left: 13px;
    padding-right: 13px;
    padding-top: 4px;
    padding-bottom: 4px;
    pointer-events: none;
    margin-right: 10px;
    font-family: "Noto Sans KR", sans-serif;

}

.skill_icon {
	font-family: "Noto Sans KR", sans-serif;
}

.skill_icon img {
	vertical-align: middle;
}

.recruit_tag {
	padding-bottom: 10px;
}


.recruit_ul {
	 visibility: visible;
	 list-style-type: square;
	 padding-left: 20px;
	 word-break: break-all;
     overflow-wrap: break-word;
}


.recruit_ul ul {
	visibility: visible;
	list-style-type: square;
}

.icon-link {
	display: inline-block;
    width: 22px;
    height: 22px;
    margin-bottom: 3px;
}

.hr_cut {
	color: rgb(244, 244, 244);
	margin-bottom: 80px;
	height: 0px;
	width: 700px;
}

#recruit_mapapi div {
	border-radius: 10px 10px 10px 10px;
	position: relative;
	text-align:center;
}

.end_button {
	display: flex;
	padding-left: 40px;
	padding-right: 40px;
	float: left;
}

.end_button2 {
	display: flex;
	padding-left: 40px;
	padding-right: 40px;
	float: right;
}

.recruit_button .recruit_button2 {
	display: inline-block;
	font-weight: 500;
	font-family: "Noto Sans KR", sans-serif;
}


.recruit_update, .recruit_delete {
	color: rgb( 51, 51, 51);
	background-color: #f3f3f3d5;
	border-radius: 20px 20px 20px 20px;
	border: 1px solid rgb(212, 212, 212);
	font-size: 18px;
	padding-left: 25px;
    padding-right: 25px;
    padding-top: 8px;
    padding-bottom: 8px;
    font-weight: 500;
    font-family: "Noto Sans KR", sans-serif;
    margin-right: 20px;
}


.recruit_list {
	color: #ffffff;
	background-color: #2e9acc;
	border-radius: 20px 20px 20px 20px;
	border: none;
	font-size: 18px;
	padding-left: 25px;
    padding-right: 25px;
    padding-top: 8px;
    padding-bottom: 8px;
    font-weight: 500;
    font-family: "Noto Sans KR", sans-serif;
}

#main_blank3 {
	position: sticky;
	z-index: 10;
	width: 220px;
	height: 80px;
    display: flex;
}

#applybox {
	position: sticky;
	z-index: 10;
	width: 220px;
	height: 100%;
    display: flex;
    padding: 20px;
    background-color: #fff;
    border-radius: 20px 20px 20px 20px;
    flex-direction: column;
    -webkit-box-pack: center;
    justify-content: center;
    align-items: center;
    border: 2px solid #5b5c5d;
    box-sizing: border-box;
}

.LoginImg {
	position: absolute;
    top: 30px;
    width: 80px;
    height: 80px;
    border-radius: 50%;
    border: 2px solid;
    background: url(/images/home/profile2.jpg) no-repeat;
}

.btnApply {
   border-radius: 5px 5px 5px 5px;
   background: rgb(119 199 239);
   border: 1px solid rgb(119 199 239);
   color: rgb(255, 255, 255);
   padding: 8px 40px;
   font-size: 14px;
   font-weight: 600;
   font-family: "Noto Sans KR", sans-serif;
}


#applybox h3 {
    margin-bottom: 40px;
    font-size: 15.5px;
    color: rgb(85, 85, 85);
    line-height: 25px;
    letter-spacing: -0.5px;
    font-weight: bold;
    font-family: "Noto Sans KR", sans-serif;
}


#applybox h1 {
	margin-top: 110px;
  	margin-bottom: 20px;
    font-size: 19px;
    color: rgb(85, 85, 85);
    line-height: 25px;
    letter-spacing: -0.5px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    font-weight: bold;
    font-family: "Noto Sans KR", sans-serif;
    line-height: 32px;
    text-align: center;
    word-break: break-word;
    word-wrap: normal;
}

.applybox_icon {
   margin-top: 20px;
   font-size: 13px;
    color: rgb(85, 85, 85);
    margin-bottom: 8px;
}


.applybox_icon i {
	font-size: 16px;
	padding: 1px;
}

</style>

</head>
<body>

<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1dae76fa8bc7a6c80a08e252c0a3cc7c&libraries=services"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include> 

<script type="text/javascript">



$(function(){
	
		// 버튼 이벤트 등록
		selectonebtn();
		applybtn();
		fRegisterButtonClickEventadver();
		//msgsendbtn();
		//writebtn();

		comcombo("reportCD","repcombo1","all","");

});


	function applybtn() {
    			if ($("#user_type").val() === "P") {
        			$("#btnApply").show();
    		
    			} else {
        		$("#btnApply").hide();
    			}
			}


	function selectonebtn() {
    		if ($("#loginID").val() === "${adverselectone.loginID }" || $("#loginID").val() === "admin" ) {
        		$("#btnUpdate").show();
        		$("#btnDelete").show();
    
    		} else {
        		$("#btnUpdate").hide();
        		$("#btnDelete").hide();
    	}
    	
	}
	
	function fRegisterButtonClickEventadver() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnDelete' : // 아라 - selectone 삭제 버튼
					fn_delete();
					break;	
				case 'btnApply' :  // 아라 - 지원하기 버튼
					fn_apply();
					break;	
				case 'btnClose' : // 수민 - 쪽지 모달 닫기
					gfCloseModal();
					break;	
			 	case 'writebtn' :  // 수민 - 쪽지 전송 버튼
			 		$("#action").val("I");
					//fn_messagelist();
					writebtn();
					break; 
			 	case 'btnDeclare' :
					$("#action").val("I");
					$("#declare_CD").val("A");
					//$("#report_CD").val(${"#repcombo1"}.val());					
					/* document.getElementById('report_no').value;
					document.getElementById('loginID').value;
					document.getElementById('repcombo1').value; */					
					fn_declareNewSave();
					break;
			}
		});
	}
			
	 function msgsendbtn() {
		
		popupinit();
		
		gfModalPop("#layer2");
		
	 	if($("loginID").val()=== "${adverselectone.loginID}"){
			$("btnInsert").show(); }
	 	/* 
			 $("btnDelete").show(); 
		}else{
			$("#btnDelete").hide(); 
		}
 */	
 }
	

	
		function writebtn(){
			
			if ( ! fn_Validate() ) {
				return;
			}
			
			var param = {
					msg_no : $("#msg_no").val(),
					msg_title : $("#msg_title").val(),
					msg_content : $("#msg_content").val(),
					msg_receiveID : $("#receiveID").val()
			}
			
			var savecallback = function(reval) {
				console.log( JSON.stringify(reval) );
				
				if(reval.returncval > 0) {
					alert("저장 되었습니다.");
					gfCloseModal();
					
				}  else {
					alert("오류가 발생 되었습니다.");				
				}
			}
			callAjax("/mypmsg/msgsenderinfo.do", "post", "json", false, param , savecallback) ;
			
		
	}
		
		
		function fn_Validate() {

			var chk = checkNotEmpty(
					[
							[ "msg_title", "제목을 입력해 주세요." ]
						,	[ "msg_content", "내용을 입력해 주세요" ]
					]
			);

			if (!chk) {
				return;
			}

			return true;
		}	
	
	

	function popupinit(object){
		
		if(object == "" || object == null || object == undefined){
			$("#msg_sendID").val("");
			$("#msg_title").val("");
			$("#msg_content").val("");
			$("#msg_receiveID").val("");
			
			$("#btnDelete").hide();
			
			$("#action").val("I");	
			
		}else{
			$("#msg_sendID").val(object.msg_sendID);
			$("#msg_title").val(object.msg_title);
			$("#msg_content").val(object.msg_content);
			$("#msg_receiveID").val(object.msg_receiveID);
			
			$("btnDelete").show();
			
			$("#action").val("U");
		
		} 
	}
	 
	
	function fn_delete() {
				
		var param = {
				corecruit_no : $("#corecruit_no").val(),
				att_no : $("#att_no").val()
		}
				
		var savecallback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("삭제 되었습니다.");		
				location.href="/recerc/employee.do";
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		callAjax("/myprmg/adverdelete.do", "post", "json", false, param , savecallback);
		
	}
	
	function fn_apply() {
		 
	      var param = {
	            corecruit_no : $("#corecruit_no").val(),
	            loginID : $("#loginID").val()
	      }
	      			
	      var savecallback = function(reval) {
				console.log( JSON.stringify(reval) );
				
				if(reval.returncval > 0) {
					alert("지원이 완료되었습니다.");
				} if (reval.returncval == 0) {
					alert("이미 지원한 공고입니다.");
				} if (reval.returncval < 0) {
					alert("오류가 발생하였습니다.");
				}
			}
	      
	      	callAjax("/myprmg/adverapply.do", "post", "json", false, param , savecallback);
	      
	}


	   
	   function fn_declarepopup(no) {
		 
			 var param = {
						corecruit_no : no,
						report_no : no
				} 
				gfModalPop("#layer3");
			 
			 
			/*  var selectdeclarecallback = function(returndata) {			
					console.log(report_no);
					dclpopupinit(returndata.adverselectone);
					console.log(report_no);
					// 모달 팝업
					gfModalPop("#layer3");
					
				}
				
				callAjax("/myprmg/adverselectone.do", "get", "text", false, param, selectdeclarecallback) ;
			 */
		}
	   
	/*    function dclpopupinit(object) {
			
			if(object == "" || object == null || object == undefined) {
				$("#dcl_corecruit_title").val("");		
				
				$("#dcl_corecruit_no").val("");
				$("#report_no").val("");
				$("#loginID").val("");
				
				$("#btnDelete").hide();
				
				$("#action").val("I");	
			} else {
				$("#dcl_corecruit_title").val(object.corecruit_title);		
				
				$("#dcl_corecruit_no").val(object.corecruit_no);
				$("#report_no").val(object.report_no);
				$("#loginID").val(object.loginID);
				

				$("#btnDelete").hide();
				

				$("#action").val("I");	
				
			}
		}
	   
 */
		
	   
	   
	   
		function fn_declareNewSave(no) {
			
			
			
			var param = {
					action : $("#action").val(),
					report_no : $("#report_no").val(),
					declared_ID : $("#declared_ID").val(),
					report_CD : $("#repcombo1").val(),
					declare_title : $("#declare_title").val(),
					declare_CD : $("#declare_CD").val()
					} 
			
			console.log( JSON.stringify(param) ); 
			var savecollback = function(reval) {
				console.log( JSON.stringify(reval) );
				
				if(reval.returncval > 0) {
					alert("신고 되었습니다.");
					gfCloseModal();
				}
					
				else {
					alert("오류가 발생 되었습니다.");				
				}
			}
			
			 /* callAjax("/mypdcl/declareNew.do", "post", "json", false, param, savecollback) ; */ 
			 callAjax("/mypdcl/declareNew.do", "post", "json", false, param , savecollback) ; 
			
		}
	
	
	
	
	


</script>

<form id="myForm" action=""  method="">

	<input type="hidden" id="currentPage" value="1">
	<input type="hidden" id="selectedInfNo" value="">
	<input type="hidden" id="corecruit_no"  name="corecruit_no"  value ="${adverselectone.corecruit_no }" />
	<input type="hidden" id="receiveID"  name="receiveID"  value ="${adverselectone.loginID }" />
	<input type="hidden" id="user_type" name="user_type" value ="${user_type}"/>	
	<input type="hidden" id="loginID" name="loginID" value ="${loginID}"/>
	<input type="hidden" id="action"  name="action"  />
	
	<input type="hidden" id="declare_CD"  name="declare_CD" value ="A"  />
	<input type="hidden" id="declare_title"  name="declare_title" value ="${adverselectone.corecruit_title }" />
	<input type="hidden" id="declared_ID"  name="declared_ID" value ="${adverselectone.loginID}"  />
	<input type="hidden" id="report_no"  name="report_no" value ="${adverselectone.corecruit_no }" />
	<input type="hidden" id="att_no"  name="att_no" value= "${adverselectone.att_no}" />
	<input type="hidden" id="report_CD"  name="report_CD" value= "${report_CD}" />
		
		
		
			<!-- 모달 배경 -->
		
		<div id="mask"></div>

	<section id="wrap_area">

			<h2 class="hidden">컨텐츠 영역</h2>
				<div id="container">
						<ul>
							<li class="lnb">
					
					<!-- lnb 영역 --> 
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
					
						</li>

				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
	               
					<div class="content">
                       
						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
							<span class="btn_nav bold">메인</span>
							<a href="../dashboard/dashboard.do" class="btn_set refresh">새로고침</a>
						</p>
					</div>
					
   
					
			<section class = "adver_recruit_explain">
			
					<c:choose>
    				<c:when test="${empty adverselectone }">
     					<p>--- 작성된 글이 없습니다 ---</p>
     				</c:when>
     				
     			<c:otherwise>
    				
     				<c:set value ="${adverselectone}" var="adverselectone" />
				
			
				<div class="recruit_head">
                    <div class="recruit_tag">
                        <h1>${adverselectone.corecruit_title }</h1>
                    </div>
                </div>

				<div class="recruit_company">
                    <div class="recruit_tag">
                        <h3><i class="fa-regular fa-building"></i>&nbsp&nbsp ${adverselectone.user_coname } / ${adverselectone.user_businesstype }</h3>
                    </div>

                    <div class="wirter_tag">
                        <h4><i class="fa-solid fa-user"></i>&nbsp&nbsp ${adverselectone.name } / ${adverselectone.loginID }</h4>
                    </div>
                </div>

				<hr class="hr_cut"></hr>

                <div class="recruit_calendar">
                    <div class="recruit_tag">
                        <h3>모집기간</h3>
                    </div>

                    <div class="recruit_period">
                        <p><i class="fa-regular fa-calendar-check"></i> &nbsp ${adverselectone.corecruit_strdate } ~ ${adverselectone.corecruit_enddate } </p>
                    </div>
                </div>


                <div class="recruit_skillstack">
                    <div class="recruit_tag">
                        <h3>기술스택</h3>
                    </div>


					
                    <div class="skill_icon">      
                    <c:forEach var="skillist" items="${skillist}">
                  			<button class="skill_button"><img src="../images/skill/${skillist.detail_name}.png" class="icon-link">&nbsp;${skillist.detail_name }</button>               
                    </c:forEach> 
                   	</div>
                </div>
	

                <div class="recruit_mainwork">
                    <div class="recruit_tag">
                        <h3>주요업무</h3>
                    </div>
                    <div class="recruit_ul_list">
                   		
                        <ul class="recruit_ul">
                             <li style="white-space:pre-wrap;"><p>${adverselectone.corecruit_mainjob }</p></li>
                    </ul>

                    </div>
                </div>

                <div class="recruit_qualify">
                    <div class="recruit_tag">
                        <h3>자격요건</h3>
                    </div>
                    <div class="recruit_ul_list">
                        <ul class="recruit_ul">
                             <li style="white-space:pre-wrap;"><p>${adverselectone.corecruit_requirement }</p></li>
                        </ul>

                        
                    </div>
                </div>

                <div class="recruit_preference">
                    <div class="recruit_tag">
                        <h3>우대사항</h3>
                    </div>
                    <div class="recruit_ul_list">
                        <ul class="recruit_ul">
                             <li style="white-space:pre-wrap;">${adverselectone.corecruit_preference }</li>
                        </ul>

                    </div>
                </div>
                
                <div class="recruit_welfare">
                    <div class="recruit_tag">
                        <h3>복지 및 혜택</h3>
                    </div>
                    <div class="recruit_ul_list">
                        <ul class="recruit_ul">
                             <li style="white-space:pre-wrap;">${adverselectone.corecruit_merit }</li>
                         </ul>

                         
                    </div>
                </div>

                <div class="recruit_map">
                    <div class="recruit_tag">
                        <h3>근무지역</h3>
                    </div>
                   
                    <div class="recruit_detail">    
                        <p> <i class="fa-solid fa-location-dot"></i>&nbsp&nbsp ${adverselectone.corecruit_address1 } &nbsp ${adverselectone.corecruit_address2 }</p>
                   
                    <div id="recruit_mapapi">
                    	${adverselectone.corecruit_address1 }
                    </div>
                              
            <!-- 카카오 map Api -->
                    
		<script type="text/javascript">

 
 			var mapContainer = document.getElementById('recruit_mapapi'), // 지도를 표시할 div 
					mapOption = {
 												center: new kakao.maps.LatLng(37.485291, 126.901616), // 지도의 중심좌표
 												level: 4 // 지도의 확대 레벨
											};  

			//지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			//주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			var keyword = '${adverselectone.corecruit_address1 }' + ' ' + '${adverselectone.corecruit_address2 }';
			
			//주소로 좌표를 검색합니다
			geocoder.addressSearch(keyword, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				
 			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

 			// 결과값으로 받은 위치를 마커로 표시합니다
 			var marker = new kakao.maps.Marker({
     							map: map,
     							position: coords
 			});

 			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
 			map.setCenter(coords);
			} 
		});    

	</script>
                  
                </div>
                   
                </div>
			
			</section>
			
            <section class = "adver_recruit_introduce">
			
				<div class="recruit_introduce">
                    <div class="recruit_tag">
                        <h3>기업/서비스 소개</h3>
                    </div>
                </div>

                <div class="recruit_introduce_img">
                   <img src="${adverselectone.att_logpath }">
                </div>

                  <div class="recruit_introduce_detail">
                	<ul>
                      	<li style="white-space:pre-wrap;">${adverselectone.corecruit_introduce }</li>
                	</ul>
                </div>

			
				
       			 </c:otherwise>
        		</c:choose>
			

			</section>

		<section class="end_button">
			
			<div class="recruit_button">
				<a href="adverwrite.do" id="btnUpdate" name="btn"><span class="recruit_update">수 정</span></a>
				<a href="" id="btnDelete" name="btn" onclick="btnDelete('${adverselectone.corecruit_no }','${adverselectone.att_no}')"><span class="recruit_delete">삭 제</span></a>
			</div>
			
		</section>	
			
		<section class="end_button2">	
			<div class="recruit_button2">
				<a href="/recerc/employee.do"><span class="recruit_list">목 록</span></a>
			</div>
			</section>		
			


        
        <section class="main_blank">
        	<div class="main_blank">
        		<p>&nbsp;</p>
        		<p>&nbsp;</p>
        		<p>&nbsp;</p>
        		<p>&nbsp;</p>
        		<p>&nbsp;</p>
        	</div>
        </section>
        
        </li>	
        
        
	<div id="main_blank3">
        		<p>&nbsp;</p>
     </div>
        
<div id="applybox">
        		<img src="/images/home/profile2.jpg" class="LoginImg" alt="사진">
        		
        		  <h1>${adverselectone.corecruit_title }</h1>
        			<h3><i class="fa-regular fa-building"></i>&nbsp;${adverselectone.user_coname }</h3>
        				<a href=""  id="btnApply" name="btn"><span class="btnApply">지원하기</span></a>
        		
        		<div class="applybox_icon">
        		<a href="javascript:fn_declarepopup('${adverselectone.corecruit_no }')"><i class="fa-solid fa-bomb"></i> 신고</a> &nbsp;| &nbsp;
        		<a href="javascript:msgsendbtn();"><i class="fa-regular fa-envelope"></i> 쪽지</a>
        		</div>
        </div> 

        
   </section> 

</form>


<script type="text/javascript">
  var main_blank3 = document.getElementById("main_blank3");
  var applybox = document.getElementById("applybox");
  var btnApply = document.getElementById("btnApply");
  var targetY = 0; // 목표 Y 위치
  var currentY = 0; // 현재 Y 위치
  var scrollSpeed = 5; // 스크롤 속도 (조절 가능)
  var bottomLimit = 20; // 내려갈 최대 Y 위치 (조절 가능)
  var spacing = -1; // main_blank3와 applybox 사이 여백

  window.addEventListener("scroll", function() {
    targetY = Math.min(bottomLimit, Math.max(0, window.pageYOffset || document.documentElement.scrollTop));
    main_blank3.style.top = targetY + "px";
    applybox.style.top = (targetY + main_blank3.offsetHeight + spacing) + "px";
  });

  function animate() {
    currentY += (targetY - currentY) / scrollSpeed;
    applybox.style.top = (currentY + main_blank3.offsetHeight + spacing) + "px";

    if (Math.abs(targetY - currentY) > 0.1) {
      requestAnimationFrame(animate);
    }
  }

  animate();

  btnApply.addEventListener("click", function() {
    // 지원하기 버튼 클릭 시 처리할 내용
    });
  
</script>



<!-- 모달팝업 -->
	<div id="layer2" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>쪽지보내기</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">보내는사람 <span class="font_red">*</span></th>
							<td colspan="3"><div>${loginID}</div></td>
						</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="msg_title" id="msg_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="msg_content" name="msg_content"> </textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">받는사람 <span class="font_red">*</span></th>
							<td colspan="3"><div><%-- ${adverselectone.name }/  --%>${adverselectone.loginID}</div></td>
							<!-- <td colspan="3"><input type="text" class="inputTxt p100" name="msg_receiveID" id="msg_receiveID" /></td> -->
						</tr>
				
					</tbody>
				</table>

	
	<!--// 모달팝업 -->

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="writebtn" name="btn"><span>보내기</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

<!-- 신고모달팝업 -->
	<div id="layer3" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>신고보기</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">신고 글제목 </th>
							<td colspan="3"><div name="declare_title" id="declare_title" >${adverselectone.corecruit_title }</div></td>
						</tr>
						<tr>
							<th scope="row">신고사유 <span class="font_red">*</span></th>
								<td colspan="3">
							    <select id="repcombo1" name="reportCD" class="repcombo"></select>
								</td>
						</tr>
				
					</tbody>
				</table>
					<div class="btn_areaC mt30">
					<a href=""	class="btnType blue"  id="btnDeclare" name="btn"><span>신고</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
           

</body>
</html>