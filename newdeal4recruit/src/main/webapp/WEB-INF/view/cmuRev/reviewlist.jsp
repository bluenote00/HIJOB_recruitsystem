<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>후기게시판</title>

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
		
	   comcombo("reportCD","repcombo1","all","");
	   
				
		// 버튼 이벤트 등록
		fRegisterButtonClickEventrev();
		
		fn_reviewlist();
		
		
	});
	

	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEventrev() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					fn_reviewlist();
					break;
				case 'btnSave' :
					fn_save();
					break;	
				case 'btnDelete' :
					$("#action").val("D");	
					fn_save();
					break;
				case 'btnDeclare' :
					$("#action").val("I");
					$("#declare_CD").val("D");
					//document.getElementById('rev_no').value
					document.getElementById('loginID').value
					fn_declareNewSave();
					break;
				case 'btnClose' :
					gfCloseModal();
					break; 
			}
		});
	}
	
	
	function fn_reviewlist(pagenum) {
		
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
			
			$("#listreview").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_reviewlist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#reviewPagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/cmurev/reviewlist.do", "post", "text", false, param, listcallback) ;
			
	}
	
	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
		
	}
	
	function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#l1_rev_title").val("");		
			$("#l1_rev_content").val("");
			$("#rev_no").val("");
			
			$("#btnSave").show();
			$("#btnDelete").hide();
			
			$("#action").val("I");	
		} else {
			$("#l1_rev_title").val(object.rev_title);		
			$("#l1_rev_content").val(object.rev_content);
			$("#rev_no").val(object.rev_no);
			
			//$("#btnDelete").show();
			
			if ($("#loginID").val() === object.loginID) {
	    		$("#btnSave").show();
	    		$("#btnDelete").show();

			} else {
				
	    		$("#btnSave").hide();
	    		$("#btnDelete").hide();
		}
			
			$("#action").val("U");	
			
		}
	}
	
	function fn_selectone(no) {
		
		 var param = {
				rev_no: no

		} 
		
		var selectonecallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
								
			popupinit(returndata.reviewsearch);
			
			// 모달 팝업
			gfModalPop("#layer1");
			/* $("#loginID").val("${sessionScope.loginID}") 
		     console.log(loginID);  */
			

			
		}
		
		callAjax("/cmurev/reviewselectone.do", "post", "json", false, param, selectonecallback) ;
		
	}
	
	function fn_save() {
		
		if ( ! fn_Validate() ) {
			return;
		}
		
		var param = {
				action : $("#action").val(),
				rev_no : $("#rev_no").val(),
				rev_title : $("#l1_rev_title").val(),
				rev_content : $("#l1_rev_content").val()
		}
		
		var savecallback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_reviewlist($("#pageno").val());
				} else {
					fn_reviewlist();
				}
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		
		callAjax("/cmurev/reviewsave.do", "post", "json", false, param, savecallback) ;
		
	}
	
	function fn_Validate() {

		var chk = checkNotEmpty(
				[
						[ "l1_rev_title", "제목을 입력해 주세요." ]
					,	[ "l1_rev_content", "내용을 입력해 주세요" ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	/* //////////////////////////   위는 파일 업이 처리
	/////////////////////////    file upload
	
	function fn_openpopup() {
        popupinit();
		
		// 모달 팝업
		gfModalPop("#layer2");
	}
	
	   function popupinitfile(object) {
			
			if(object == "" || object == null || object == undefined) {
				$("#file_rev_title").val("");		
				$("#file_rev_content").val("");
				$("#rev_no").val("");
				$("#upfile").val("");		
				
				$("#previewdiv").empty();
				
				$("#btnDeleteFile").hide();
				
				$("#action").val("I");	
			} else {
				/* 
				"notice_del_yn":"N"
	            "loginID":"admin"
	             "notice_no":71
	             "notice_title":"oofile"
	              "notice_date":"2023-06-12 09:16:58.0"
	              "notice_cont":"ddddd"
	              "file_no":30
	              "file_name":"0524.sql"
	             "logic_path":"/serverfile\\\\notice\\0524.sql"
	              "physic_path":"W:\\FileRepository\\\\notice\\0524.sql"
	              "file_size":34498
	              "exten":"sql"
	              "name":"관리자" 
				
				$("#file_rev_title").val(object.rev_title);		
				$("#file_rev_content").val(object.rev_content);
				$("#rev_no").val(object.rev_no);
				$("#upfile").val("");		
				
				var inserthtml = "<a href='javascript:fn_filedownload()'>";
				
				if(object.file_name == "" || object.file_name == null || object.file_name == undefined) {
					inserthtml += "";
				} else {
					var selfile = object.file_name;
				    var selfilearr = selfile.split(".");
				    var lastindex = selfilearr.length - 1;
				    if(selfilearr[lastindex].toLowerCase() == "jpg" || selfilearr[lastindex].toLowerCase() == "gif" || selfilearr[lastindex].toLowerCase() == "jpge" || selfilearr[lastindex].toLowerCase() == "png") {
				    	  inserthtml += "<img src='" + object.logic_path + "' style='width:100px; height:80px' />";
				    } else {
				    	  inserthtml += object.file_name;
				    }				
				} 
				

				inserthtml += "</a>"
				
				$("#previewdiv").empty().append(inserthtml);
				
				$("#btnDeleteFile").show();
				
				$("#action").val("U");	
			}
		}
	
    function fn_selectonefile(no) {
		
		//alert(no);
		
		var param = {
				rev_no : no
				
		}
		
		var selectoncallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
								
			popupinitfile(returndata.reviewsearch);
			
			// 모달 팝업
			gfModalPop("#layer2");
			
		}
		
		callAjax("/cmurev/reviewselectone.do", "post", "json", false, param, selectoncallback) ;
		
	}  
   */
	
   
   
   
   function fn_declarepopup(no) {
		
		 var param = {
					rev_no : no,
					report_no : no
			} 
		
		 var selectdeclarecallback = function(returndata) {			
				console.log( JSON.stringify(returndata) );
				dclpopupinit(returndata.reviewsearch);
				
				// 모달 팝업
				gfModalPop("#layer3");
				
			}
			
			callAjax("/cmurev/reviewselectone.do", "post", "json", false, param, selectdeclarecallback) ;
		
	}
   
   function dclpopupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#dcl_rev_title").val("");		
			$("#dcl_rev_content").val("");
			$("#rev_no").val("");
			$("#report_no").val("");
			$("#loginID").val("");
			
			$("#btnDelete").hide();
			
			$("#action").val("I");	
		} else {
			$("#dcl_rev_title").val(object.rev_title);		
			$("#dcl_rev_content").val(object.rev_content);
			$("#rev_no").val(object.rev_no);
			$("#report_no").val(object.rev_no);
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
				declare_title : $("#dcl_rev_title").val(),
				declare_CD : $("#declare_CD").val()
				}
		
		console.log( JSON.stringify(param) );
		var savecollback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("신고 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_reviewlist($("#pageno").val());
				} else {
					fn_reviewlist();
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
<!-- 	<input type="hidden" id="rev_no"  name="rev_no"  />
	<input type="hidden" id="rev_title"  name="rev_title"  />
	<input type="hidden" id="rev_content"  name="rev_content"  /> -->
	<input type="hidden" id="pageno"  name="pageno"  />
	<input type="hidden" id="loginID"  name="loginID"  value="${sessionScope.loginId}" /> 
	<input type="hidden" id="report_no"  name="report_no"  />
	<input type="hidden" id="declare_CD"  name="declare_CD" value= "D"  />
	<input type="hidden" id="report_CD"  name="report_CD" value= "${report_CD}" />
	<input type="hidden" id="loginID"  name="declared_ID"  />
	
	
	
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
								class="btn_nav bold">커뮤니티</span> <span class="btn_nav bold">후기게시판
								</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>
                        
                        
						<p class="conTitle">
						
							<span>후기내역</span> <span class="fr">
						
					 		<!-- <select id="date" name="date" style="width: 150px;">
							        <option value="" >전체</option>
									<option value="Y" >삭제</option>
									<option value="N" >미삭제</option>
							</select>  -->
							 <select id="searchKey" name="searchKey" style="width: 90px;" >
							        <option value="" >전체</option>
									<option value="writer" >작성자</option>
									<option value="title" >제목</option>
							</select> 
							<input type="text" style="width: 265px; height: 25px;" id="sname" name="sname">
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검 색</span></a>
							 <a class="btnType blue" href="javascript:fn_openpopup();" name="modal"><span>등 록</span></a>
							</span>
						</p>
					
						
						<div class="reviewList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									
									<col width="40%">
									<col width="20%">
									<col width="25%">
									<col width="15%">
								</colgroup>
	
								<thead>
									<tr>
										
										<th scope="col">제목</th>
										<th scope="col">작성일자</th>
										<th scope="col">작성자</th>
										<th scope="col">신고</th>
									</tr>
								</thead>
								<tbody id="listreview"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="reviewPagination"> </div>
						
						
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
					<%-- 
						<c:if test="${post.authorID == loginID}">
							<a href= "/posts/${post.loginID}/edit">수정</a>
							<a href= "/posts/${post.loginID}/delete">삭제</a> 
						</c:if> --%>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="l1_rev_title" id="l1_rev_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
								<textarea id="l1_rev_content" name="l1_rev_content"></textarea> 
							   <!--  <textarea id="dcl_rev_content" name="dcl_rev_content"> </textarea> -->
							</td>
						</tr>
				
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>저장</span></a> 
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
				<strong>게시글 올리기</strong>
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
				
				<div class="btn_areaC mt30">
					<a href=""	class="btnType blue"  id="btnSave" name="btn"><span>저장</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>

		 	</dd>
		</dl> 
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
	<!-- 모달팝업 -->
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
	<!--// 모달팝업 -->
</form>
</body>
</html>