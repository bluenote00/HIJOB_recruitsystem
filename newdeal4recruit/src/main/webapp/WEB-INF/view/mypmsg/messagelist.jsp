<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>알림내역</title>

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
		fRegisterButtonClickEventmsg();
		
		fn_messagelist();
		
		
		
	});
	

	function fRegisterButtonClickEventmsg() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					fn_messagelist();
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
	
	
		
	
	function fn_messagelist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
		  	searchKey : $("#searchKey").val()
		  , name : $("#name").val()
		  , pageSize : pageSize
		  , pageBlockSize : pageBlockSize
		  , pagenum : pagenum
		} 
		
		var listcallback = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listmessage").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_messagelist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#messagePagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/mypmsg/messagelist.do", "post", "text", false, param, listcallback) ;
			
	}
	
	
 	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
		
	} 
 
 	 	
	 function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#msg_title").val("");		
			$("#msg_content").val("");
			$("#msg_no").val("");
	 		
			
			$("#btnDelete").hide();
			
			$("#action").val("I");
		} else {
			$("#msg_title").val(object.msg_title);		
			$("#msg_content").val(object.msg_content);
			$("#msg_no").val(object.msg_no);
	
			
			$("#btnDelete").show();
			
			$("#action").val("U");
		} 
	}	


	 
	 
	function fn_selectone(no,title) {
		
		 var param = {
				 msg_no : no
				,msg_title : title
				
		} 
		
		var selectonecallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
								
			popupinit(returndata.messagesearch);
			
			// 모달 팝업
			gfModalPop("#layer1");
			
		}
		
		callAjax("/mypmsg/messageselectone.do", "post", "json", false, param, selectonecallback) ;
		
	}
	
	
function fn_save() {
		
		 /* if ( ! fn_Validate() ) {
			return;
		}  */
		
		var param = {
				action : $("#action").val(),
				msg_no : $("#msg_no").val(),
				msg_title : $("#msg_title").val(),
				msg_content : $("#msg_content").val()	
			
		}
		
		var savecallback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_messagelist($("#pageno").val());
				} else {
					fn_messagelist();
				}
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		 callAjax("/mypmsg/messagesave.do", "post", "json", false, param, savecallback) ; 
		/* callAjax("/mypmsg/messagesave.do", "post", "json", false, $("#myForm").serialize(), savecallback) ; */ 
		
	}
	
	
	 function fn_Validate() {

		var chk = checkNotEmpty(
				[
						 [ "msg_title", "제목을 입력해 주세요." ] 
					,	[ "msg_content", "내용을 입력해 주세요." ]
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
	<input type="hidden" id="msg_no"  name="msg_no"  />
<!-- <input type="hidden" id="msg_title"  name="msg_title"  />
	<input type="hidden" id="msg_content"  name="msg_content"  /> -->
	<input type="hidden" id="loginID" name="loginID" value ="${loginID}"/>	

	
	<!-- <input type="hidden" id="pageno"  name="pageno"  /> -->
	
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
								class="btn_nav bold">마이페이지</span> <span class="btn_nav bold">쪽지내역
								</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>
                       
                        
						<p class="conTitle">
							<span>쪽지내역</span> <span class="fr">
							
					 		<!-- <select id="date" name="date" style="width: 150px;">
							        <option value="" >전체</option>
									<option value="Y" >읽은쪽지</option>
									<option value="N" >읽지않은쪽지</option>
							</select>
							-->  
							
							 <select id="searchKey" name="searchKey" style="width: 90px;" >
							        <option value="" >전체</option>
									<option value="writer" >작성자</option>
									<option value="title" >제목</option>
							</select>
 
							
							<input type="text" style="width: 260px; height: 25px;" id="name" name="name">
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검 색</span></a>
						<!-- <a href="" class="btnType blue" id="btnClose" name="btn"><span>보내기</span></a> 	-->
							<a class="btnType blue" href="javascript:fn_openpopup();" name="modal"><span>보내기</span></a>
							</span>
						</p> 

						<div class="messageList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									
									<col width="20%">
									<col width="50%">
									<col width="15%">
									<col width="15%">
									
								</colgroup>
	
								<thead>
									<tr>
										
										<th scope="col">제목</th>
										<th scope="col">내용</th>
										<th scope="col">수신자</th>
										<th scope="col">발신자</th>
									</tr>
								</thead>
								<tbody id="listmessage"></tbody>
							</table>
						</div>
							
						<div class="paging_area"  id="messagePagination"> </div>
						
					</div> <!--// content -->
 				
					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	

	<!--받은 쪽지내역 확인 팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>관리자에게 쪽지보내기</strong>
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
							<th scope="row">보내는사람</th>
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
							<th scope="row">받는사람</th>
							<td colspan="3"> <div id="receiveID" name="receiveID">admin</div></td>
						</tr>
				  
				</tbody>
				</table>


				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>전송</span></a> 
				 	<!-- <a href="" class="btnType blue" id="btnDelete" name="btn"><span>삭제</span></a>  -->
					<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

	<!--// 모달팝업 -->
</form>
</body>
</html>