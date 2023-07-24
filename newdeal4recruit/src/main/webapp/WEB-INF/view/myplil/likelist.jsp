<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <c:if test="${sessionScope.user_Type ne 'P'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>하이잡 :: 좋아요리스트</title>

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


<!-- sweet swal import -->
                              
<script type="text/javascript">

	//페이징 설정
	var pageSize = 10;     
	var pageBlockSize = 5;    

    

	/** OnLoad event */ 
	$(function() {
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
		
		fn_likelist();
		
		
	});
	

    

	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
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
				case 'btnDeleteFile' :
					$("#action").val("D");	
					fn_savefile();
					break;		
				case 'btnSaveFile' :
					fn_savefile();
					break;	
				case 'btnDeletelike' :
					$("#action").val("D");	
					fn_selectonelike(yn);
					break;	
				case 'btnClose' :
				case 'btnCloseFile' :
					gfCloseModal();
					break;
			}
		});
	}
	
	//좋아요 버튼 - mouseover / out 기능
	$(function(){
		  $(".list_pic1").mouseover(function(){
		    $(".fa-regular.fa-heart").css("visibility","visible");
		  }).mouseout(function(){
		    $(".fa-regular.fa-heart").css("visibility","hidden");
		  });
		});

	$(function(){
		  $(".list_pic2").mouseover(function(){
		    $(".fa-regular.fa-heart").css("visibility","visible");
		  }).mouseout(function(){
		    $(".fa-regular.fa-heart").css("visibility","hidden");
		  });
		});

	// 좋아요 버튼 - click 기능  
	$(function(){
		    $(".like_button").click(function(){
		      var heartIcon = $(this).find(".fa-regular.fa-heart");
		      heartIcon.toggleClass("fa-regular");
		      heartIcon.toggleClass("fa-solid");
		    });
		  });

	
	
	function fn_likelist(pagenum){
		
		
		pagenum = pagenum || 1;
		
		var param ={
				
			likeyn : $("#likeyn").val()
		  ,	searchKey : $("#searchKey").val()
		  , sname : $("#sname").val()
		  , loginid : $("#loginid").val()
		  , pageSize : pageSize
		  , pageBlockSize : pageBlockSize
		  , pagenum : pagenum
		}
		

		
		var listcollabck = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listlike").empty().append(returnvalue);
			
			var  likecnt = $("#likecnt").val();
			
			console.log("likecnt : " + likecnt);
			
			var paginationHtml = getPaginationHtml(pagenum, likecnt, pageSize, pageBlockSize, 'fn_likelist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#noticePagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/myplil/likelistsearch.do", "post", "text", false, param, listcollabck) ;
			
	
		
		
	}
	

	function fn_selectonelike(ln) {
		//e.preventDefault();
		$("#action").val("D");	

		//alert(no);
		/* if(ln == null || ln == "" || ln == undefined){
			(like_number.val(""));
			
		} */
		

		var param = {
				
				action : $("#action").val(),
				corecruit_no : ln

		}
		

		var selectoncallback = function(reval) {			
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("좋아요 취소 되었습니다.");
					fn_likelist();
			
					}

			else {
				alert("오류가 발생 되었습니다.");				
			}
			
		}
		
		callAjax("/myplil/likedelete.do", "post", "json", false, param, selectoncallback) ;
		
	}
	
	
	</script>

	</head>
	<body>
	<form id="myForm" action=""  method="">
		<input type="hidden" id="action"  name="action"  />
		<input type="hidden" id="notice_no"  name="notice_no"  />
		<input type="hidden" id="pageno"  name="pageno"  />
		<input type="hidden" id="like_number"  name="like_number"  />
		
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
									class="btn_nav bold">운영</span> <span class="btn_nav bold">공지사항
									관리</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
							</p>
							
							<p class="conTitle">
								<span>좋아요목록</span> <span class="fr"> 
      							 <select id="searchKey" name="searchKey" style="width: 150px;" >
								        <option value="title" >공고제목</option>
								</select> 
								<input type="text" style="width: 300px; height: 25px;" id="sname" name="sname">
								<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검  색</span></a>
								</span>
							</p>
							
							<div class="likeList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="15%">
										<col width="50%">
										<col width="20%">
										<col width="10%">
									</colgroup>
		
									<thead>
										<tr>
											<th scope="col">좋아요번호</th>
											<th scope="col">공고제목</th>
											<th scope="col">공고작성자</th>
											<th scope="col">좋아요 취소</th>
										</tr>
									</thead>
									<tbody id="listlike"></tbody>
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
		<div id="layer1" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong>그룹코드 관리</strong>
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
								<td colspan="3"><input type="text" class="inputTxt p100" name="notice_title" id="notice_title" /></td>
							</tr>
							<tr>
								<th scope="row">내용 <span class="font_red">*</span></th>
								<td colspan="3">
								    <textarea id="notice_cont" name="notice_cont"> </textarea>
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
								<th scope="row">제목 <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100" name="file_notice_title" id="file_notice_title" /></td>
							</tr>
							<tr>
								<th scope="row">내용 <span class="font_red">*</span></th>
								<td colspan="3">
								    <textarea id="file_notice_cont" name="file_notice_cont"> </textarea>
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
						<a href="" class="btnType blue" id="btnSaveFile" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnDeleteFile" name="btn"><span>삭제</span></a>  
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