<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>후기</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 페이징 설정
	var pageSize = 10;     
	var pageBlockSize = 5;    
	
	   /** OnLoad event */ 
	   $(function() {
	      
/* 	      // 부서 콤보    상세코드테이블의 상세코드, 상세코드명 으로 만듬   
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
	      
	      fn_revlist();
	      
	      
	   });



	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); //reload 방지하기 위해서

			var btnId = $(this).attr('id');

			switch (btnId) {   //btnID라는 값이 들어오면 
				case 'btnSearch' :
					fn_revlist();
					break;
				case 'btnSave' :
					$("#action").val("U");	
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
	
	
	function fn_revlist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
		    searchKey : $("#searchKey").val()
	  	  , sname : 	$("#sname").val()   
		  , pageSize : pageSize
		  , pageBlockSize : pageBlockSize
		  , pagenum : pagenum
		}
		
		var listcollabck = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listrev").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_revlist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#revPagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/mngrmg/revlist.do", "post", "text", false, param, listcollabck) ;
			
	}
	
	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
		
	}
	
	function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#rev_title").val("");
			$("#rev_content").val("");
			$("#rev_no").val("");
			
			$("#btnDelete").hide();
			
			$("#action").val("I");	
		} else {
			$("#rev_title").val(object.rev_title);		
			$("#rev_content").val(object.rev_content);
			$("#rev_no").val(object.rev_no);
			
			$("#btnDelete").show();
			
			$("#action").val("U");	
		}
	}
	
	function fn_selectone(no) {
		
		//alert(no);
		
		var param = {
				rev_no : no
		}
		
		var selectoncallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
								
			popupinit(returndata.revsearch);
			
			// 모달 팝업
			gfModalPop("#layer1");
			
		}
		
	callAjax("/mngrmg/revselectone.do", "post", "json", false, param, selectoncallback) ;
		
	}
	
	function fn_save() {
		
		if ( ! fn_Validate() ) {
			return;
		}
		
		var param = {
				action : $("#action").val(),
				rev_no : $("#rev_no").val(),
				rev_title : $("#rev_title").val(),
				rev_content : $("#rev_content").val()
		}
		
		var savecollback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_revlist($("#pageno").val());
				} else {
					fn_revlist();
				}
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		//callAjax("/mngrmg/revsave.do", "post", "json", false, param, savecollback) ;
		callAjax("/mngrmg/revsave.do", "post", "json", false, $("#myForm").serialize() , savecollback) ;
		
	}
	
	function fn_Validate() {

		var chk = checkNotEmpty(
				[
						[ "rev_title", "제목을 입력해 주세요." ]
					,	[ "rev_content", "내용을 입력해 주세요" ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	
	
/* 	function enterKey() {
		if(window.event.keyCode == 13) {
			
			btnSearch();
			
		}				
	}
	 */
	
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="action"  name="action"  />
	<input type="hidden" id="rev_no"  name="rev_no"  />
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
								class="btn_nav bold">운영</span> <span class="btn_nav bold">후기게시판
								관리</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>후기게시판</span> <span class="fr"> 
							<select id="" name="" style="width: 80px;">
							        <option value="" >전체</option>
							</select> 
							 <select id="searchKey" name="searchKey" style="width: 120px;" >
							        <option value="" >전체</option>
									<option value="writer" >작성자</option>
									<option value="title" >제목</option>
							</select> 
							<input onkeyup="enterKey();" type="text" style="width: 250px; height: 28px;" id="sname" name="sname">
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검색</span></a>
							</span>
						</p>
						
						<div class="revList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="15%">
									<col width="40%">
									<col width="15%">
									<col width="22%">
									<col width="8%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">후기 번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성날짜</th>
										<th scope="col">작성자</th>
										<th scope="col">삭제여부</th>
									</tr>
								</thead>
								<tbody id="listrev"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="revPagination"> </div>
						
                     
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
				<strong>후기게시판 관리</strong>
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
							<td colspan="3"><input type="text" class="inputTxt p100" name="rev_title" id="rev_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="rev_content" name="rev_content"> </textarea>
							</td>
						</tr>
				
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>삭제여부(Y)</span></a> 
					<a href="" class="btnType blue" id="btnDelete" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
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

					<tbody>
						<tr>
							<th scope="row">후기 번호 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="file_rev_no" id="file_rev_no" /></td>
						</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="file_rev_title" name="file_rev_title"> </textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>삭제여부(Y)</span></a> 
					<a href="" class="btnType blue" id="btnDelete" name="btn"><span>삭제</span></a> 
					<a href="" class="btnType gray" id="btnCloseFile" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>