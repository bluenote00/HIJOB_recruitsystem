<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Q&A게시판</title>

<style>
#container ul li.contents {padding:0 20px;background:#fff; width:800px; height:1000px;}
#container ul li.contents .content {padding-top:16px;margin-bottom:20px; width:800px;height:1000px;}

#wrap_area {
   position: relative;
}


#wrap_area table {
   font-size: 1em;
}



</style>

<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>


<script type="text/javascript">

	// 페이징 설정
	var pageSize = 10;     
	var pageBlockSize = 5;    
	
	
	
	/** OnLoad event */ 
	$(function() {
		
		// 버튼 이벤트 등록
		
		fRegisterButtonClickEventqna();
		
		fn_questionlist();
		
		
		// 신고콤보박스
		comcombo("reportCD","repcombo1","all","");
		
		
		
	});


	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEventqna() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					fn_questionlist();
					break;	
				 case 'btnqnaSave' :
					fn_qnasave();
					break;	
				 case 'btnDeclare' :
						$("#action").val("I");
						$("#declare_CD").val("D");
						//document.getElementById('loginID').value
						fn_declareNewSave();
				case 'btnqnaDelete' :
					$("#action").val("D");	
					 fn_save(); 
					break;	 
					case 'btnClose' :
					gfCloseModal();
					break; 
			}
		});
	}
	
	
	function fn_questionlist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
				searchKey : $("#searchKey").val()
		  , 	sname : $("#sname").val()
		  , pageSize : pageSize
		  , pageBlockSize : pageBlockSize
		  , pagenum : pagenum
		} 
		
		var listcallback = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listquestion").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_questionlist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#questionPagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/cmuqna/questionlist.do", "post", "text", false, param, listcallback) ;
			
	}
	
	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
		
	}
	
	function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#l1_qna_title").val("");		
			$("#l1_qna_content").val("");
			$("#qna_no").val("");
			
			$("#btnSave").show();
			$("#btnDelete").hide();
			
			$("#action").val("I");	
		} else {
			$("#l1_qna_title").val(object.qna_title);		
			$("#l1_qna_content").val(object.qna_content);
			$("#qna_no").val(object.qna_no);
			
			//$("#btnDelete").show();
			
			console.log("object.loginID : " + object.loginID);
			
			if ($("#loginID").val() === object.loginID) {
	    		$("#btnqnaSave").show();
	    		$("#btnqnaDelete").show();

			} else {
				
	    		$("#btnqnaSave").hide();
	    		$("#btnqnaDelete").hide();
		    }
			
			$("#action").val("U");	
		}
	}
	
	function fn_selectone(no) {
		
		
		var param = {
				qna_no: no
		}
		
				
		var selectonecallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
								
			popupinit(returndata.questionsearch);
		/*     console.log("${sessionScope.loginId}");
		    
		    console.log($("#loginID").val());
		     */
			// 모달 팝업
			gfModalPop("#layer1");
			//$("#loginID").val("${sessionScope.loginId}") 
			
			
		}
						
		callAjax("/cmuqna/questionselectone.do", "post", "json", false, param, selectonecallback) ;
		
		}
	
	
	function fn_qnasave() {
		
		if ( ! fn_Validate() ) {
			return;
		}
		
		var param = {
				action : $("#action").val(),
				qna_no : $("#qna_no").val(),
				qna_title : $("#l1_qna_title").val(),
				qna_content : $("#l1_qna_content").val(),		
		}
		
		var savecallback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_questionlist($("#pageno").val());
				} else {
					fn_questionlist();
				}
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		
			 callAjax("/cmuqna/questionsave.do", "post", "json", false, param, savecallback) ; 
			
	}
	
 	function fn_Validate() {

		var chk = checkNotEmpty(
				[
						[ "l1_qna_title", "제목을 입력해 주세요." ]
					,	[ "l1_qna_content", "내용을 입력해 주세요" ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	 
	//////////////////////////   위는 파일 업이 처리
	/////////////////////////    file upload

	
   
   function fn_declarepopup(no) {
		
		 var param = {
					qna_no : no,
					report_no : no
			} 
		
		 var selectdeclarecallback = function(returndata) {			
				console.log( JSON.stringify(returndata) );
				dclpopupinit(returndata.questionsearch);
				
				// 모달 팝업
				gfModalPop("#layer3");
				
			}
			
			callAjax("/cmuqna/questionselectone.do", "post", "json", false, param, selectdeclarecallback) ;
		
	}
   
   function dclpopupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#dcl_qna_title").val("");		
			$("#dcl_qna_content").val("");
			$("#qna_no").val("");
			$("#report_no").val("");
			$("#loginID").val("");
			
			$("#btnDelete").hide();
			
			$("#action").val("I");	
		} else {
			$("#dcl_qna_title").val(object.qna_title);		
			$("#dcl_qna_content").val(object.qna_content);
			$("#qna_no").val(object.qna_no);
			$("#report_no").val(object.qna_no);
			$("#loginID").val(object.loginID);

			$("#btnDelete").show();
			
			$("#action").val("U");	
			
		}
	}
   

	
   
   
   
	function fn_declareNewSave(no) {
		
		
		
		var param = {
				action : $("#action").val(),
				report_no : $("#report_no").val(),
				report_CD : $("#repcombo1").val(),
				declared_ID : $("#loginID").val(),
				declare_title : $("#dcl_qna_title").val(),
				declare_CD : $("#declare_CD").val()
				}
		
		console.log( JSON.stringify(param) );
		var savecollback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("신고 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_questionlist($("#pageno").val());
				} else {
					fn_questionlist();
				}
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		//callAjax("/mngNot/noticesave.do", "post", "json", false, param, savecollback) ;
		//callAjax("/mypdcl/declareNew.do", "post", "json", false, $("#myForm").serialize() , savecollback) ;
		callAjax("/mypdcl/declareNew.do", "post", "json", false, param , savecollback) ;
		
	}
   
	
	
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="action"  name="action"  />
	<input type="hidden" id="qna_no"  name="qna_no"  /> 
	<input type="hidden" id="pageno"  name="pageno"  />
	<input type="hidden" id="loginID"  name="loginID"  value="${sessionScope.loginId}" /> 
	
	
	
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
								class="btn_nav bold">커뮤니티</span> <span class="btn_nav bold">Q&A게시판
								</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>Q&A게시판</span> <span class="fr"> 
						
							<!-- <select id="date" name="date" style="width: 150px;">
							        <option value="" >전체</option>
									<option value="Y" >삭제</option>
									<option value="N" >미삭제</option>
							</select>  -->
							 <select id="searchKey" name="searchKey" style="width: 80px;" >
							        <option value="" >전체</option>
									<option value="writer" >작성자</option>
									<option value="title" >제목</option>
							</select> 
							<input type="text" style="width: 250px; height: 25px;" id="sname" name="sname">
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검 색</span></a>
							 <a class="btnType blue" href="javascript:fn_openpopup();"  name="modal"><span>등 록</span></a>
							</span>
						</p>
						
						<div class="questionList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									
									<col width="40%">
									<col width="30%">
									<col width="30%">
									<col width="5%">
												
								</colgroup>
	
								<thead>
									<tr>
										
										<th scope="col">제목</th>
										<th scope="col">작성일자</th>
										<th scope="col">작성자</th>
										<th scope="col">신고</th>
										
										
									</tr>
								</thead>
								<tbody id="listquestion"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="questionPagination"> </div>
						
				

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
							<td colspan="3"><input type="text" class="inputTxt p100" name="l1_qna_title" id="l1_qna_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="l1_qna_content" name="l1_qna_content"> </textarea>
							</td>
						</tr>
				
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnqnaSave" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnqnaDelete" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

	<!--// 모달팝업 -->
	
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
							<td colspan="3"><input type="text" class="inputTxt p100" name="dcl_rev_title" id="dcl_rev_title" /></td>
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
	<!--// 신고모달팝업 -->
	
</form>
</body>
</html>