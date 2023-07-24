<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>가입 기업관리</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<style>

	#container ul li.contents {
	    padding: 0 20px;
	    background: #fff;
	    width: 800px;
	}
	
	#compPagination .next {
		display: none;
	}
	
	#compPagination .pre {
		display: none;
	}
	
	.paging a.last {
		margin-left: 5px;
	}
	
	.paging a.first {
		margin-right: 5px;
	}
	
</style>




<script type="text/javascript">

	// 페이징 설정
	var pageSize = 10;     
	var pageBlockSize = 5;


	/** OnLoad event */ 
	$(function() {
		
		// 버튼 이벤트 등록
		
		fn_complist();
		
		
	});
	function fn_complist(pagenum) {
		  pagenum = pagenum || 1;

		  var listcallback = function (returnvalue) {
		    console.log(returnvalue);
		    $("#listterm").empty().append(returnvalue);
		    var totalcnt = $("#totalcnt").val();
		    console.log("totalcnt : " + totalcnt);
		    var paginationHtml = getPaginationHtml(
		      pagenum,
		      totalcnt,
		      pageSize,
		      pageBlockSize,
		      'fn_complist'
		    );
		    console.log("paginationHtml : " + paginationHtml);
		    $("#compPagination").empty().append(paginationHtml);
		    $("#pageno").val(pagenum);
		    // 다음 페이지 버튼 및 마지막 페이지 버튼 클릭 시 swal 창 표시
		    if (pagenum * pageSize >= totalcnt) {
		      $("#compPagination").find(".next").on("click", function () {
		        swal("마지막 페이지입니다.");
		      });
		      $("#compPagination").find(".last").on("click", function () {
		        swal("마지막 페이지입니다.");
		      });
		    }
		  };

		  var param = {
		    pageSize: pageSize,
		    pageBlockSize: pageBlockSize,
		    pagenum: pagenum
		  };

		  callAjax("/mngtmg/termlist.do", "post", "text", false, param, listcallback);
		}
</script>

</head>
<body>

<!-- 행사 관리 리스트 -->

<form id="myForm" action=""  method="">
	<input type="hidden" id="action"  name="action"  />
	<input type="hidden" id="user_no"  name="user_no"  />
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
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
							<span class="btn_nav bold">운영</span>
								 <span class="btn_nav bold">
								 	행사 회차관리
								</span> 
								<a href="../mngtmg/term.do" class="btn_set refresh">
									새로고침
								</a>
								<p class="conTitle">
									<span>행사 회차관리 </span> 
										<span class="fr"> 
										<a href="/mngtmg/termcreate.do" class="btnType blue" id="btnSearch" name="btn"><span>박람회 개최</span></a>
									 <select id="searchKey" name="searchKey" style="width: 80px; margin-left: 140px;" >
									        <option value="" >전체</option>
											<option value="writer" >제목</option>
											<option value="title" >주소</option>
									</select> 
									<input type="text" style="width: 150px; height: 28px;" id="sname" name="sname">
									<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검색</span></a>
									
									</span>
								</p>
								
	
						<div class="compList">
							<table class="col">
								<caption></caption>
								<colgroup>
									<col width="40px">
									<col width="150px">
									<col width="65px">
									<col width="250px">
									<col width="250px">
									<col width="125px">
									<col width="125px">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="col">회차명</th>
										<th scope="col">우편 번호</th>
										<th scope="col">행사지 도로명 주소</th>
										<th scope="col">행사지 상세 주소</th>
										<th scope="col">행사 시작 일자</th>
										<th scope="col">행사 종료 일자</th>
									</tr>
								</thead>
								<tbody id="listterm"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="compPagination"> </div>
						
						
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
</form>
</body>
</html>