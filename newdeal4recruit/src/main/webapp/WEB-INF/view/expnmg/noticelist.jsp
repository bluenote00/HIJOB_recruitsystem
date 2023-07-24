<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공지사항</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<style>

#container ul li.contents {
    padding: 0 20px;
    background: #fff;
    width: 800px;
}

#noticeimg {
	width: 500px;
	height: 400px;
}

.noticeList table {
  margin-top: 25px; 
}


dt strong {
  display: block;
  text-align: center;
}




</style>


<script type="text/javascript">



	// 페이지 설정
	var pageSize = 10;
	var pageBlockSize = 5;
	
	
	
	$(function() {
	
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
		
		fn_noticelist();
	});
	
	
	
	
	/** 버튼 이벤트 등록 */
	
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); //reload 방지하기 위해서
			
			var btnId = $(this).attr('id');
			
			switch (btnId) {   //btnID라는 값이 들어오면
				case 'btnSearch' :
					fn_noticelist();
					break;
				case 'btnSave' :
					fn_save();
					break;	
				case 'btnDelete' :
					$("#action").val("D");	
					fn_save();
					break;
					
/* 				case 'btnDeleteReal' :
					$("#action").val("D");	
					fn_save();
					break;	 */
					
 /* 				case 'btnDeleteFileexpnmg' :
					$("#action").val("D");	
					fn_savefile();
					break;		 */
					
				case 'btnSaveFileexpnmg' :
					fn_savefile();
					break;	 
				case 'btnClose' :
				case 'btnCloseFile' :    
					gfCloseModal();
					break; 

 				case 'btnNoticeY' :
 					fn_noticeylist();
 					break;
					
			}
		});
	}
	
	
	function fn_noticelist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
				delyn: $("#delyn").val()
			,	searchKey : $("#searchKey").val()
			,		sname : $("#sname").val()
			,	pageSize: pageSize
			,	pageBlockSize: pageBlockSize
			, 	pagenum : pagenum
		}
		
		var listcollabck = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listnotice").empty().append(returnvalue);
			
			var totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_noticelist');
			console.log("paginationHtml : " + paginationHtml);
			
			$("#noticePagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/expnmg/noticelist.do", "post", "text", false, param, listcollabck);		
		
	}
	
/* 	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
		
	} */
	
	function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#notice_title").val("");
			$("#notice_content").val("");
			$("#notice_no").val("");
			
			$("#btnDelete").hide();
			
			$("#action").val("I");
		} else {
			$("#notice_title").val(object.notice_title);
			$("#notice_content").val(object.notice_content);
			$("#notice_no").val(object.notice_no);
			
			$("#noticeimg").attr("src", object.att_logpath);
			
			$("btnDelete").show();
			
			$("#action").val("U");
		}
	}
	
	function fn_selectone(no) {
		
		//alert(no);
		
		var param = {
				notice_no : no
		}
		
		var selectioncallback = function(returndata) {
			console.log( JSON.stringify(returndata) );
			
			popupinit(returndata.noticesearch);
			
			// 모달 팝업
			gfModalPop("#layer3");
						
		}
		
		callAjax("/expnmg/noticeselectone.do", "post", "json", false, param, selectioncallback);
		
	}
	
	function fn_save() {
		
		if( ! fn_Validate() ) {
			return;
		}
		
		var param = {
				action : $("#action").val(),
				notice_no : $("#notice_no").val(),
				notice_title : $("#notice_title").val(),
				notice_content : $("#notice_content").val()
		}
		
		var savecollback = function(reval) {
			console.log( JSON.stringify(reval) );
						
			if(reval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_noticelist($("#pageno").val());
				} else {
					fn_noticelist();
				}
			} else {
				alert("오류가 발생 되었습니다.");
			}
		}
		
		//callAjax("/expnmg/noticesave.do", "post", "json", false, param, savecollback) ;
		callAjax("/expnmg/noticesave.do", "post", "json", false, param , savecollback);
		
	}
	
	function fn_Validate() {
		
		var chk = checkNotEmpty(
				[
				 		["notice_title", "제목을 입력해 주세요." ]
				 	,	["notice_content", "내용을 입력해 주세요" ] 
				 ]
		);
		
		if (!chk) {
			return;
		}
		
		return true;
	}

	//////////////////////////   위는 파일 업이 처리
	/////////////////////////    file upload
	
	function fn_openpopupfileexpnmg() {
		popupinitfile();
		
		// 모달 팝업
		gfModalPop("#layer2");
	}
	
	function popupinitfile(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#file_notice_title").val("");
			$("#file_notice_content").val("");
			$("#notice_no").val("");
			$("#upfile").val("");
			
			$("#previewdiv").empty();
			
			$("#btnDeleteFile").hide();
			
			$("#actionexpnmg").val("I");
		} else {
			/* 
			"notice_del_yn":"N"
            "loginID":"admin"
             "notice_no":71
             "notice_title":"oofile"
              "notice_date":"2023-06-12 09:16:58.0"
              "notice_content":"ddddd"
              "file_no":30
              "file_name":"0524.sql"
             "logic_path":"/serverfile\\\\notice\\0524.sql"
              "physic_path":"W:\\FileRepository\\\\notice\\0524.sql"
              "file_size":34498
              "exten":"sql"
              "name":"관리자" 
			 */
			$("#file_notice_title").val(object.notice_title);		
			$("#file_notice_content").val(object.notice_content);
			$("#notice_no").val(object.notice_no);
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
			
			$("#actionexpnmg").val("U");	
		}
	}
	
	function preview(event) {
		var image = event.target;
		  
		//alert(image.files[0].file_name + " : " + image.files[0].file_nm + " : " + image.files[0].name);
		
		 if(image.files[0]){
			  //alert(window.URL.createObjectURL(image.files[0]));
			 
			  var selfile = image.files[0].name;
		      var selfilearr = selfile.split(".");
		      var inserthtml = "";
		      var lastindex = selfilearr.length - 1;
		      
		      
		      if(selfilearr[lastindex].toLowerCase() == "jpg" || selfilearr[lastindex].toLowerCase() == "gif" || selfilearr[lastindex].toLowerCase() == "jpge" || selfilearr[lastindex].toLowerCase() == "png") {
		    	  inserthtml = "<img src='" + window.URL.createObjectURL(image.files[0]) + "' style='width:100px; height:80px' />";
		      } else {
		    	  inserthtml = selfile;
		      }
			  
			  
			  $("#previewdiv").empty().append(inserthtml);
		}
		
		
	}
			 
	function fn_savefile() {		
				
		var frm = document.getElementById("regform");
		frm.enctype = 'multipart/form-data';
		var fileData = new FormData(frm);
		
		console.log("fileData : " + fileData);
		
		var filesavecallback = function(returnval) {
			console.log( JSON.stringify(returnval) );
			
			if(returnval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_noticelist($("#pageno").val());
				} else {
					fn_noticelist();
				}
			} else {
				alert("오류가 발생 되었습니다.");
			}			
		}
		
		callAjaxFileUploadSetFormData("/expnmg/noticesavefile.do", "post", "json", true, fileData, filesavecallback);
	
	}
	
	function fn_selectonefile(no) {
		
		//alert(no);
		
		var param = {
				notice_no :no 
		}
		
		var selectoncallback = function(returndata) {
			console.log( JSON.stringify(returndata) );
			
			popupinitfile(returndata.noticesearch);
			
			// 모달 팝업
			gfModalPop("#layer2");
			
		}
		
		callAjax("/expnmg/noticeselectone.do", "post", "json", false, param, selectoncallback) ;
				
	}
	
	function fn_filedownload() {
		alert("다운로드");
		
		var params = "";
		params += "<input type='hidden' name='notice_no' id='notice_no' value='"+ $("#notice_no").val() +"' />";
		
		jQuery("<form action='/expnmg/downloadnoticefile.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();

	}


	function fn_noticeylist(pagenum) {
	    pagenum = pagenum || 1;

	    var param = {
	    	delyn: "Y",
	        searchKey: $("#searchKey").val(),
	        sname: $("#sname").val(),
	        pageSize: pageSize,
	        pageBlockSize: pageBlockSize,
	        pagenum: pagenum
	    };

	    var listCallback = function(returnValue) {
	        console.log(returnValue);

	        $("#listnotice").empty().append(returnValue);

	        var totalcnt = $("#totalcnt").val();

	        console.log("totalcnt: " + totalcnt);

	        var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_noticeylist');
	        console.log("paginationHtml: " + paginationHtml);

	        $("#noticePagination").empty().append(paginationHtml);

	        $("#pageno").val(pagenum);
	    };

	    callAjax("/expnmg/noticeylist.do", "post", "text", false, param, listCallback);
	    
	}
	
	
	
</script>

</head>
<body>
<form id="myForm" >	
	<input type="hidden" id="pageno"  name="pageno"  />
	<input type="hidden" id="UserType" name="UserType" value="${UserType}">
	
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
							<a href="../dashnotice/dashnotice.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">운영</span> <span class="btn_nav bold">공지사항
								관리</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>공지사항</span> <span class="fr"> 
<!-- 						<select id="delyn" name="delyn" style="width: 80px;">
							        <option value="" >전체</option>
									<option value="Y" >삭제</option>
							</select>  -->
  							 
						
							 <select id="searchKey" name="searchKey" style="width: 75px;" >

									<option value="" class="btnType blue" >전체</option>
									<option value="writer" >작성자</option>
									<option value="title" >제목</option>
							</select> 
							<input type="text" style="width: 200px; height: 28px;" id="sname" name="sname">
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검색</span></a>
 							<c:if test="${userType eq 'A'}">	 
<!-- 							<a class="btnType blue" href="javascript:fn_openpopup();" name="modal"><span>신규등록</span></a>      -->
							 	<a class="btnType blue" href="javascript:fn_openpopupfileexpnmg();" name="modal"><span>신규등록</span></a>
							</c:if>		 		
							</span>
							
						</p>
						
						<div class="noticeList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="50%">
									<col width="20%">
									<col width="15%">
									<col width="10%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="col">제목</th>
										<th scope="col">작성일자</th>
										<th scope="col">작성자</th>
										<th scope="col">삭제여부</th>
<!-- 										<select id="noticecombo_Y" name="noticeCD" class="noticecombo"></select>
										<select id="noticecombo_N" name="noticeCD" class="noticecombo"></select> -->
										<c:if test="${userType eq 'A'}">
										<a href="" class="btnType"  id="btnNoticeY" name="btn"><span>삭제여부(Y)</span></a>
										</c:if>	
									</tr>
								</thead>
								<tbody id="listnotice"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="noticePagination"> </div>
						
                     
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
<!-- <div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>그룹코드 관리</strong>
			</dt>
			<dd class="content">
				 s : 여기에 내용입력 
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
							<td colspan="3"><input type="text" class="inputTxt p100" name="notice_title" id="notice_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="notice_content" name="notice_content"> </textarea>
							</td>
						</tr>
						<tr>
							
						</tr>
				
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->
				
<!--  				<div class="btn_areaC mt30">
 				<c:if test="${userType eq 'A'}">  
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>저장</span></a> 				
					<a href="" class="btnType blue" id="btnDelete" name="btn"><span>삭제</span></a>
				</c:if> 	 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div> -->
	
    <form id="regform">
    <input type="hidden" id="actionexpnmg"  name="actionexpnmg"  />
	<input type="hidden" id="notice_no"  name="notice_no"  />
	<div id="layer2" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>신규등록 +파일</strong>
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
							<td colspan="3"><input type="text" class="inputTxt p100" name="file_notice_title" id="file_notice_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="file_notice_content" name="file_notice_content"> </textarea>
							</td>
						</tr>
				        <tr>
							<td colspan=2>
							    <input type="file" id="upfile"  name="upfile"  onchange="javascript:preview(event)" />
							</td>
							<td colspan=2>
							      <div id="previewdiv" ></div>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
						<c:if test="${userType eq 'A'}">  
						<a href="" class="btnType blue" id="btnSaveFileexpnmg" name="btn"><span>저장</span></a>				
						</c:if> 
					<a href="" class="btnType gray" id="btnCloseFile" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
	
			
 	<div id="layer3" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>게시글</strong>
			</dt>
			<dd class="content">
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="60px">
						<col width="*">
						<col width="60px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">제목 </th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="notice_title" id="notice_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용 </th>
							<td colspan="3">
							    <textarea id="notice_content" name="notice_content"> </textarea>
							</td>
						</tr>
 						<tr>
							<td colspan="3">
							    <img id="noticeimg" > 
							</td>
						</tr> 
										
				
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->
				
  				<div class="btn_areaC mt30">
 				<c:if test="${userType eq 'A'}">  
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>저장</span></a> 				
					<a href="" class="btnType blue" id="btnDelete" name="btn"><span>삭제여부(Y)</span></a>
				</c:if> 	 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div> 		
	</form>
	
</form>


</body>
</html>

