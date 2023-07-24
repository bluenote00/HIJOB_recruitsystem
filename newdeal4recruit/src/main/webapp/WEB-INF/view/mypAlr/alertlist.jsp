<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>알림내역</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 페이징 설정
	var pageSize = 10;     
	var pageBlockSize = 5;    
	
	
	
	/** OnLoad event */ 
	$(function() {
		/* 
		// 부서 콤보    상세코드테이블의 상세코드, 상세코드명 으로 만듬   
		comcombo("dep_cd","deptcombo","all","");   // group_code, combo_name, type(기본값  all : 전체   sel : 선택)    , selvalue(선택 되어 나올 값)         
		
		// combo box 종류  acc : 회계 계정     조회 대상 테이블  tb_acnt_sbject   
		selectComCombo("acc","acccombo","all","","");  // combo type(combo box 종류),  combo_name, type(기본값  all : 전체   sel : 선택) , "", "" 
		
		// combo box 종류  accd : 상세 회계계정   acccombo 변경시 계정 상세 재조회 event   조회 대상 테이블  tb_dt_sbject   
		$('#acccombo').change(function() {   
			selectComCombo("accd","accdcombo","all",$('#acccombo').val(),"");  // combo type(combo box 종류),  combo_name, type(기본값  all : 전체   sel : 선택) , 선택된 상위 계정코드, "" 
		});
		
		// combo box 종류  cli : 거래처    조회 대상 테이블  tb_clnt   
		selectComCombo("cli","clicombo","all","","");  // combo type(combo box 종류),  combo_name, type(기본값  all : 전체   sel : 선택) , "", "" 
		
		// combo box 종류  pro : 제품 전체   조회 대상 테이블  tb_product   
		selectComCombo("pro","proallcombo","all","","");  // combo type(combo box 종류),  combo_name, type(기본값  all : 전체   sel : 선택) , "", "" 
		
		
		// 제품 대분류
		productCombo("l","ltypecombo","all","","","","");  // combo type( l : 대분류   m : 중분류   s : 소분류) combo_name, type(기본값  all : 전체   sel : 선택) ,  대분류 코드, 중분류코드, 소분류 코드, ""
		
		// 제품 중분류
		$('#ltypecombo').change(function() {
			productCombo("m","mtypecombo","all",$("#ltypecombo").val(),"","","");   // combo type(combo box 종류),  combo_name, type(기본값  all : 전체   sel : 선택) , 선택된 상위 계정코드, "" 
			$("#stypecombo option").remove();
			$("#ptypecombo option").remove();
		});
		
		// 제품 소분류
		$('#mtypecombo').change(function() {   
			productCombo("s","stypecombo","all",$("#ltypecombo").val(),$("#mtypecombo").val(),"","");   // combo type(combo box 종류),  combo_name, type(기본값  all : 전체   sel : 선택) , 선택된 상위 계정코드, "" 
			$("#ptypecombo option").remove();
		});		
		
		// 제품
		$('#stypecombo').change(function() {   
			productCombo("p","ptypecombo","all",$("#ltypecombo").val(),$("#mtypecombo").val(),$("#stypecombo").val(),"");   // combo type(combo box 종류),  combo_name, type(기본값  all : 전체   sel : 선택) , 선택된 상위 계정코드, "" 
		});
		 */
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
		
		fn_alertlist();
		
		
	});
	

	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					fn_alertlist();
					break;
			 	case 'btnSave' :
					fn_save();
					break;	 
				case 'btnDelete' :
					$("#action").val("D");	
					fn_save();
					break;	
				case 'btnClose' :
					gfCloseModal();
					break; 
			}
		});
	}
	
	
	function fn_alertlist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
		  	searchKey : $("#searchKey").val()
		  , 	user_no : $("#user_no").val()
		  , pageSize : pageSize
		  , pageBlockSize : pageBlockSize
		  , pagenum : pagenum
		} 
		
		var listcallback = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listalert").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_alertlist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#alertPagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/mypair/alertlist.do", "post", "text", false, param, listcallback) ;
			
	}
	
 function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
		
	} 
 
	 function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#notify_title").val("");		
			$("#notify_content").val("");
			$("#notify_no").val("");
			
			$("#btnDelete").hide();
			
			
			$("#action").val("U");
		/* 	$("#action").val("I");	 */
		} else {
			$("#notify_title").val(object.notify_title);		
			$("#notify_content").val(object.notify_content);
			$("#notify_no").val(object.notify_no);
			
			$("#btnDelete").show();
			
			$("#action").val("D");
			/* $("#action").val("U"); */	
			
		} 
	}	
	
	
	function fn_selectone(no,title) {
		
		 var param = {
				notify_no : no
				,notify_title : title
				
		} 
		
		var selectonecallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
								
			popupinit(returndata.alertsearch);
			
			// 모달 팝업
			gfModalPop("#layer1");
			
		}
		
		callAjax("/mypair/alertselectone.do", "post", "json", false, param, selectonecallback) ;
		
	}
	
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="action"  name="action"  />
	<input type="hidden" id="notify_no"  name="notify_no"  />
	<input type="hidden" id="pageno"  name="pageno"  />
	
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
								class="btn_nav bold">마이페이지</span> <span class="btn_nav bold">알림내역
								</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>
                        
                        
						<p class="conTitle">
						
							<span>알림내역</span> <span class="fr">
							
						</p>
						
					
						<p class="conSearch" align="center" >
					 		<select id="date" name="date" style="width: 150px;">
							        <option value="" >전체</option>
									<option value="Y" >읽은알림</option>
									<option value="N" >읽지않은알림</option>
							</select> 
							 <select id="searchKey" name="searchKey" style="width: 150px;" >
							        <option value="" >전체</option>
									<option value="writer" >작성자</option>
									<option value="title" >제목</option>
							</select> 
							<input type="text" style="width: 300px; height: 25px;" id="name" name="name">
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검 색</span></a>
							<!--  <a class="btnType blue" href="javascript:fn_openpopup();" name="modal"><span>등 록</span></a> -->
							</span>
						</p>
					
						
						<div class="alertList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="15%">
									<col width="20%">
									<col width="50%">
									<col width="15%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">글번호</th>
										<th scope="col">제목</th>
										<th scope="col">내용</th>
										<th scope="col">작성자</th>
									</tr>
								</thead>
								<tbody id="listalert"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="alertPagination"> </div>
						
						
						</div> <!--// content -->
 				
					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 모달팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>내용보기</strong>
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
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="notify_title" id="notify_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="notify_content" name="notify_content"> </textarea>
							</td>
						</tr>
				
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
				<!-- 	<a href="" class="btnType blue" id="btnSave" name="btn"><span>저장</span></a>  -->
					<a href="" class="btnType blue" id="btnDelete" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>확인</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

	<div id="layer2" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>상세코드 관리</strong>
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

			<!-- 		<tbody>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="file_review_title" id="file_review_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="file_review_cont" name="file_review_cont"> </textarea>
							</td>
						</tr>
				  
					</tbody> -->
				</table>

		<!-- 	</dd>
		</dl> -->
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>