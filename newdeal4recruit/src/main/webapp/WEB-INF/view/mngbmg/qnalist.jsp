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

<style>

#container ul li.contents {
    padding: 0 20px;
    background: #fff;
    width: 800px;
}

dt strong {
  display: block;
  text-align: center;
}

</style>

<script type="text/javascript">


	// 페이징 설정
	var pageSize = 10;     
	var pageBlockSize = 5;    
	
	
	
	/** OnLoad event => 화면이 커지면 아래 함수 2개가 발생함 */ 
	$(function() {
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
		
		fn_qnalist();
		
		
	});
	

	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); //reload 방지하기 위해서

			var btnId = $(this).attr('id');

			switch (btnId) {   //btnID라는 값이 들어오면 
				case 'btnSearch' :
					fn_qnalist();
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
	
	
	function fn_qnalist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
	     	searchKey : $("#searchKey").val()
	      , sname : $("#sname").val()   
		  , pageSize : pageSize
		  , pageBlockSize : pageBlockSize
		  , pagenum : pagenum
		}
		
		var listcollabck = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listqna").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_qnalist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#qnaPagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/mngbmg/qnalist.do", "post", "text", false, param, listcollabck) ;
			
	}
	
	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
		
	}
	
	function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#qna_title").val("");
			$("#qna_content").val("");
			$("#qna_no").val("");
			
			$("#btnDelete").hide();
			
			$("#action").val("I");	
		} else {
			$("#qna_title").val(object.qna_title);		
			$("#qna_content").val(object.qna_content);
			$("#qna_no").val(object.qna_no);
			
			$("#btnDelete").show();
			
			$("#action").val("U");	
		}
	}
	
	function fn_selectone(no) {
		
		//alert(no);
		
		var param = {
				qna_no : no
		}
		
		var selectoncallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
								
			popupinit(returndata.qnasearch);
			
			// 모달 팝업
			gfModalPop("#layer1");
			
		}
		
	callAjax("/mngbmg/qnaselectone.do", "post", "json", false, param, selectoncallback) ;
		
	}
	
	function fn_save() {
		
		if ( ! fn_Validate() ) {
			return;
		}
		
		var param = {
				action : $("#action").val(),
				qna_no : $("#qna_no").val(),
				qna_title : $("#qna_title").val(),
				qna_content : $("#qna_content").val()
		}
		
		var savecollback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_qnalist($("#pageno").val());
				} else {
					fn_qnalist();
				}
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		//callAjax("/mngbmg/qnasave.do", "post", "json", false, param, savecollback) ;
		callAjax("/mngbmg/qnasave.do", "post", "json", false, $("#myForm").serialize() , savecollback) ;
		
	}
	
	function fn_Validate() {

		var chk = checkNotEmpty(
				[
						[ "qna_title", "제목을 입력해 주세요." ]
					,	[ "qna_content", "내용을 입력해 주세요" ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	

	
	
	
	 
	

		


	
	
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="action"  name="action"  />
	<input type="hidden" id="qna_no"  name="qna_no"  />
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
								class="btn_nav bold">운영</span> <span class="btn_nav bold">Q&A게시판
								관리</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>Q&A게시판</span> <span class="fr"> 
							<select id="" name="" style="width: 100px;">
							        <option value="" >전체</option>
							</select> 
							 <select id="searchKey" name="searchKey" style="width: 120px;" >
							        <option value="" >전체</option>
									<option value="writer" >작성자</option>
									<option value="title" >제목</option>
							</select> 
							<input type="text" style="width: 250px; height: 28px;" id="sname" name="sname">
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검  색</span></a>
							</span>
						</p>
						
						<div class="qnaList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="15%">
									<col width="40%">
									<col width="15%">
									<col width="20%">
									<col width="10%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">Q&A번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성날짜</th>
										<th scope="col">작성자</th>
										<th scope="col">삭제여부</th>
									</tr>
								</thead>
								<tbody id="listqna"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="qnaPagination"> </div>
						
                     
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
				<strong>Q&A 게시글</strong>
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
							<td colspan="3"><input type="text" class="inputTxt p100" name="qna_title" id="qna_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="qna_content" name="qna_content"> </textarea>
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
							<th scope="row">Q&A번호 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="file_qna_no" id="file_qna_no" /></td>
						</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="file_qna_title" name="file_qna_title"> </textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSave"><span>삭제여부(Y)</span></a>
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