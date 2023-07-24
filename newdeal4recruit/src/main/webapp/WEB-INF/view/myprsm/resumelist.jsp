<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>이력서 관리</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<style>
.switch {
  position: relative;
  display: block;
  vertical-align: top;
  width: 100px;
  height: 30px;
  padding: 3px;
  margin: 0 10px 10px 0;
  background: linear-gradient(to bottom, #eeeeee, #FFFFFF 25px);
  background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF 25px);
  border-radius: 18px;
  box-shadow: inset 0 -1px white, inset 0 1px 1px rgba(0, 0, 0, 0.05);
  cursor: pointer;
}
.switch-input {
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}
.switch-label {
  position: relative;
  display: block;
  height: inherit;
  font-size: 10px;
  text-transform: uppercase;
  background: #eceeef;
  border-radius: inherit;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.15);
}
.switch-label:before, .switch-label:after {
  position: absolute;
  top: 50%;
  margin-top: -.5em;
  line-height: 1;
  -webkit-transition: inherit;
  -moz-transition: inherit;
  -o-transition: inherit;
  transition: inherit;
}
.switch-label:before {
  content: attr(data-off);
  right: 11px;
  color: #aaaaaa;
  text-shadow: 0 1px rgba(255, 255, 255, 0.5);
}
.switch-label:after {
  content: attr(data-on);
  left: 11px;
  color: #FFFFFF;
  text-shadow: 0 1px rgba(0, 0, 0, 0.2);
  opacity: 0;
}
.switch-input:checked ~ .switch-label {
  background: #0088cc;
  border-color: #0088cc;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), inset 0 0 3px rgba(0, 0, 0, 0.2);
}
.switch-input:checked ~ .switch-label:before {
  opacity: 0;
}
.switch-input:checked ~ .switch-label:after {
  opacity: 1;
}
.switch-handle {
  position: absolute;
  top: 4px;
  left: 4px;
  width: 28px;
  height: 28px;
  background: linear-gradient(to bottom, #FFFFFF 40%, #f0f0f0);
  background-image: -webkit-linear-gradient(top, #FFFFFF 40%, #f0f0f0);
  border-radius: 100%;
  box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
}
.switch-handle:before {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -6px 0 0 -6px;
  width: 12px;
  height: 12px;
  background: linear-gradient(to bottom, #eeeeee, #FFFFFF);
  background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF);
  border-radius: 6px;
  box-shadow: inset 0 1px rgba(0, 0, 0, 0.02);
}
.switch-input:checked ~ .switch-handle {
  left: 74px;
  box-shadow: -1px 1px 5px rgba(0, 0, 0, 0.2);
}

/* Transition
========================== */
.switch-label, .switch-handle {
  transition: All 0.3s ease;
  -webkit-transition: All 0.3s ease;
  -moz-transition: All 0.3s ease;
  -o-transition: All 0.3s ease;
}

#container ul li.contents {
    padding: 0 20px;
    background: #fff;
    width: 800px;
    height: 1000px;
}
</style>

<script type="text/javascript">

	// 페이징 설정
	var pageSize = 10;     
	var pageBlockSize = 5;    
	
	
	
	/** OnLoad event */ 
	$(function() {
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
		
		fn_resumelist();
		
		
	});
	

	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {

				case 'btnSave' :
					fn_save();
					break;	
				case 'btnDelete' :
					$("#action").val("D");	
					fn_save();
					break;	
				case 'btnSaveFile' :
					fn_savefile();
					break;	
				case 'btnClose' :
				case 'btnCloseFile' :
					gfCloseModal();
					break;
			}
		});
	}
	
	function resumeForm(){
		
		
		location.href="/myprsm/resumeForm.do";
// 		fn_selectone("","I");
		
	}
	
	function fn_resumePicture() {
		resumePicture();
		
		// 모달 팝업
		gfModalPop("#layer2");
		
	}
	
   function resumePicture(object) {
		
		if(object == "" || object == null || object == undefined) {
			
			$("#resume_no").val("");
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
			 */
			 $("#resume_no").val(object.resume_no);
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
   
   function fn_savefile() {
		
		var frm = document.getElementById("myForm");
		frm.enctype = 'multipart/form-data';
		var fileData = new FormData(frm);
		
		var filesavecallback = function(returnval) {
			console.log( JSON.stringify(returnval) );
			
			if(returnval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();
				
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
				
		callAjaxFileUploadSetFormData("/myprsm/savefile.do", "post", "json", true, fileData, filesavecallback);
		
	}

	
	function fn_resumelist() {
		

		
		var param = {
			resume_no : $("#resume_no").val()
		   ,loginID : $("#loginID").val()

		}
		
		var listcallabck = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listresume").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
// 			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_resumelist');
// 			console.log("paginationHtml : " + paginationHtml);
			 
// 			$("#noticePagination").empty().append( paginationHtml );
			
// 			$("#pageno").val(pagenum);
		}

		callAjax("/myprsm/resumelist.do", "post", "text", false, param, listcallabck) ;
			
	}
	
	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
		
	}
	
	
	
	function fn_selectone(no,action,skill1,skill2,skill3) {
		
		action = action || "U";
		
		
		var params = "";
		//var action = "U";
		
		
		params += "<input type='hidden' name='resume_no' id='resume_no' value='"+ no +"' />";
		params += "<input type='hidden' name='action' id='action' value='"+ action +"' />";
		params += "<input type='hidden' name='skill1' id='skill1' value='"+ skill1 +"' />";
		params += "<input type='hidden' name='skill2' id='skill2' value='"+ skill2 +"' />";
		params += "<input type='hidden' name='skill3' id='skill3' value='"+ skill3 +"' />";

		
		jQuery("<form action='/myprsm/resumeselectone.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();
	
		
	}
	
	
	
	function checkchange(resume_no) { 
		
		var result = jQuery('.switch-input').is(':checked')?'Y':'N';    
		
		$("#result").val(result);
		
		$("#resume_no").val(resume_no);
		
		param = {
			resume_no :$("#resume_no").val()
			,result : $("#result").val()
		}
		
		
		var checkchangecallback = function(returnval){
			
			if(returnval.checkchange > 0) {
				alert("공개 이력서로 변경되었습니다.");
				
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		callAjax("/myprsm/checkchange.do", "post" ,"json" , false, param, checkchangecallback);
	}
	
</script>

</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" id="result" name="result" value ="">
		<input type="hidden" id="loginID" name="loginID"  value="${loginID}"/>
		<input type="hidden" id="action" name="action" /> 
		<input type="hidden" id="resume_no" name="resume_no" value="${resume_no}" /> 
		<input type="hidden" id="pageno" name="pageno" />
		
		
		

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
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav bold">마이페이지</span>
								<span class="btn_nav bold">이력서 관리</span> 
								<a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>이력서 관리</span> <span class="fr"> </span>
							<div style="left: 500px; " >
								<a class="btnType blue"  onclick="javascript:resumeForm(1)" name="modal"  style="margin-bottom:5px;"><span>이력서 등록</span></a>
								<a class="btnType blue"  onclick="javascript:fn_resumePicture()" name="modal"  style="margin-bottom:5px;"><span>사진 등록</span></a>
							</div>
							
							</p>

							<div class="noticeList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										
										<col width="40%">
										<col width="40%">
										<col width="40%">
									</colgroup>

									<thead>
										<tr>
											
											<th scope="col">제목</th>
											<th scope="col">작성일자</th>
											<th scope="col" id="openunopen">공개/비공개</th>
										</tr>
									</thead>
									<tbody id="listresume"></tbody>
								</table>
							</div>




						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> 
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
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
					<a href="" class="btnType blue" id="btnSaveFile" name="btn"><span>저장</span></a>
					<a href="" class="btnType blue" id="btnDeleteFile" name="btn"><span>삭제</span></a>  
					<a href="" class="btnType gray" id="btnCloseFile" name="btn"><span>취소</span></a>
				</div>
			</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>

	</form>
</body>
</html>