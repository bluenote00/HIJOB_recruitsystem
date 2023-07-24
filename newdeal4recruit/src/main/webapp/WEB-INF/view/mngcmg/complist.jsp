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
	
	
	#Modificationlayer {
  		top: 10px !important;
	}
	div.ModifilayerPop   {display:none;clear:both;position: relative;width:100%;margin-top:20px;}
	div.ModifilayerPop .closePop {position: absolute;top:20px;right:30px;width:23px;height:23px;background:url(/images/front/common/com_btn.png) 0 -423px no-repeat;}
	div.ModifilayerPop p.title {margin-bottom:5px;border-bottom: 2px solid #d3d3d3;}
	div.ModifilayerPop p.title strong {font-size: 15px;}
	
	div.ModifilayerType2   {position: absolute;width:400px;padding:0px;margin:0;border: 3px solid #3e4463;background-color: #f3f3f3;z-index: 9999;
   		-moz-box-shadow: 2px 2px 3px #666;
   		-webkit-box-shadow: 2px 2px 3px #666;
  		 box-shadow: 2px 2px 3px #666;
	}
	div.ModifilayerType2 > dl  dt   {height:40px;line-height:40px;padding: 0px 20px;background-color: #3e4463;}
	div.ModifilayerType2 > dl  dt strong   {font-size:17px;color: #fff;}
	div.ModifilayerType2 > dl  dd   {padding: 40px 30px;}
	div.ModifilayerType2 > dl  dd table.row > tbody > tr > th {background: #bbc2cd;}
	div.ModifilayerType2 .closePop,
	div.ModifilayerType2 .closePop2 {position: absolute;top:12px;right:13px;width:15px;height:15px;background:url(/images/admin/comm/set_btn.png) -456px -50px no-repeat;}
</style>




<script type="text/javascript">

	// 페이징 설정
	var pageSize = 10;     
	var pageBlockSize = 5;


	/** OnLoad event */ 
	$(function() {
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
		
		fn_complist();
		
		
	});
	
	function fcancleModal() {
		
		  gfCloseModal();
		  swal("승인 처리되었습니다.")
		  $("body").removeClass("scroll-lock");
		  
		}
		
	/* 회원가입 정보 수정 모달창 실행 */
	function fModification() {
	  
	  window.scrollTo(0, 0);
	  
	  $("body").addClass("scroll-lock");
	  // 모달 팝업
	  gfModalPop("#Modificationlayer");
	}
	
	/* 회원가입 정보 수정 모달창 실행 */
	function message() {
	  // 모달 팝업
	  gfModalPop("#layer1");
	}
	
	
	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					fn_complist();
					break;
				case 'btnSave' :
					swal("승인 되었습니다.");
					$("#action").val("U");	
					fn_save();
					break;		
				case 'btnDelete' :
					$("#action").val("D");
					fn_save();
					message();
					break;	
				case 'btnClose' :
					gfCloseModal();
					break;
			}
		});
	}	
	
	var pagenum = 1; // 전역 변수로 선언하고 초기화

	function filterList() {
		  var selectedValue = $("#delyn").val();
		  var userType = "";
		  if (selectedValue === "1") {
		    userType = "H";
		  } else if (selectedValue === "2") {
		    userType = "C";
		  } else if (selectedValue === "3") {
		    userType = "R";
		  }

		  var listcallback = function (response) {
		    // 성공적으로 응답을 받았을 때 처리할 로직
		    console.log(response);
		    $("#listcomp").empty().append(response);
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
		    delyn: userType || null
		  };
		  $.ajax({
		    url: "/mngcmg/complist.do",
		    type: "post",
		    dataType: "text",
		    data: param,
		    success: function (response) {
		      // 성공적으로 응답을 받았을 때 처리할 로직
		      listcallback(response);
		    },
		    error: function (xhr, status, error) {
		      // 요청 실패 시 처리할 로직
		      console.log("AJAX 요청 실패:", error);
		    }
		  });
		}

	function fn_complist(pagenum) {
		  pagenum = pagenum || 1;

		  var listcallback = function (returnvalue) {
		    console.log(returnvalue);
		    $("#listcomp").empty().append(returnvalue);
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
		    delyn: $("#delyn").val(),
		    searchKey: $("#searchKey").val(),
		    sname: $("#sname").val(),
		    pageSize: pageSize,
		    pageBlockSize: pageBlockSize,
		    pagenum: pagenum
		  };

		  // delyn 선택 여부 확인
		  if ($("#delyn").val()) {
		    // delyn이 선택되었을 경우에만 delyn 값을 파라미터로 포함하여 요청
		    param.delyn = $("#delyn").val();
		  }

		  callAjax("/mngcmg/complist.do", "post", "text", false, param, listcallback);
		}

	
	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#Modificationlayer");
		
	}
	
	function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			//$("#user_coname").val("");		
			$("#user_no").val("");
						
			$("#btnDelete").hide();
			
			$("#action").val("I");	
			
		} else {
			//$("#user_coname").val(object.user_coname);		
			$("#user_no").val(object.user_no);
			
			$("#btnDelete").show();
			
			$("#action").val("U");				
			
		}		
	}

	function fn_selectone(no) {
	    var param = {
	        user_no: no
	    };

	    var selectoncallback = function(returndata) {
	        console.log(JSON.stringify(returndata));

	        gfModalPop("#Modificationlayer");

	        var userData = returndata.compsearch;
	        console.log(returndata.compsearch);

	        document.getElementById('registerId').value = userData.loginID;
	        document.getElementById('user_businesstype').value = userData.user_businesstype;
	        document.getElementById('user_coname').value = userData.user_coname;
	        document.getElementById('user_rpname').value = userData.user_rpname;
	        document.getElementById('user_zipcode').value = userData.user_zipcode;
	        document.getElementById('user_address1').value = userData.user_address1;
	        document.getElementById('user_address2').value = userData.user_address2;
	        document.getElementById('user_cornm').value = userData.user_cornm;
	        document.getElementById('user_manager').value = userData.user_manager;
	        document.getElementById('user_hp').value = userData.user_hp;

	        popupinit(returndata.compsearch);
	    };

	    callAjax("/mngcmg/compselectone.do", "post", "json", false, param, selectoncallback);
	}
	
	
	function fn_save() {
		
		
		var param = {
				action : $("#action").val(),
				user_no:$("#user_no").val(),
		}
		console.log(action);
		console.log(user_no);
		var savecollback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				gfCloseModal();
				
				if($("#action").val() == "U") {
					fn_complist($("#pageno").val());
				} else {
					fn_complist();
				}
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
		
		callAjax("/mngcmg/compsave.do", "post", "json", false, param , savecollback) ;
		
	}
	
	$(document).ready(function() {
		  // Add change event listener to the 'delyn' select element
		  $('#delyn').change(function() {
		    // Get the selected option value
		    var selectedValue = $(this).val();
		    
		    // Call the fn_complist() function to trigger the search
		    fn_complist(selectedValue);
		  });
		  
		// 반려 버튼 클릭 시 이벤트 처리
		$('#btnDelete').click(function() {
		  // Modificationlayer에서 로그인 ID 값을 가져와서 변수에 저장
		  var loginID = $('#registerId').val();

		  // 받는 사람 필드에 로그인 ID 값 설정
		  $('#msg_receiveID').text(loginID);
		});
	});
	
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
	
	
	function fn_msgsend() {
		
		$("#action").val("I");
		
		 if ( ! fn_Validate() ) {
			return;
		}
		
		var param = {
				action : $("#action").val(),
				msg_no : $("#msg_no").val(),
				msg_title : $("#msg_title").val(),
				msg_content : $("#msg_content").val(),
				msg_receiveID : $("#receiveID").val()
			
		}
		
		var savecallback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				swal("반려 되었습니다.");
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
		
		
		
		 callAjax("/mypmsg/msgsenderinfo.do", "post", "json", false, param, savecallback) ; 
		/* callAjax("/mypmsg/messagesave.do", "post", "json", false, $("#myForm").serialize(), savecallback) ; */ 
		
	}
	
	
</script>

</head>
<body>

	
	
	<!-- 가입 정보 모달팝업 -->


	<div id="Modificationlayer" class="layerPosition layerPop ModifilayerType2" style="width: 600px; top: 10px; position: fixed;" >
      <form id="ModificationForm" action="" method="post" >
	      <input type="hidden" name="action" id="action" value="">
	      <input type="hidden" id="declared_ID"  name="declared_ID" value ="${adverselectone.loginID}"  />

	      
		<dl>
			<dt style="text-align: center; padding-top: 10px; background-color: #3e4463;color: #ffffff; height: 30px;">
				<strong style="font-size:150%;">가입 기업 승인관리</strong>
			</dt>
			<dd class="content" style="padding: 10px 20px;">
				<div style="font-size: 90%; margin-bottom: 5px;">
				</div>
				<table class="row">
					<thead>
						
					</thead>
					
					<caption>caption</caption>
					<colgroup>
						<col width="130px">	
					</colgroup>
						<tbody>
							<tr class="hidden">
								<td><input type="text" name="div_cd" id="div_cd" /></td>
						 		<td><input type="text" name="user_type" id="user_type" /></td> 
								<td><input type="text" name="user_no" id="user_no" /></td>
							</tr>
							<tr>
								<th scope="row">
									<span class="font_red">
										*
									</span>
									아이디
								</th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="loginID" placeholder="ex) hijob@hijob.com"
									id="registerId" disabled /></td>
								<td><input type="button" value="중복 확인"
									onclick="loginIdCheck()" style="width: 80px; height: 25px;" disabled /></td>
							</tr>
							
							
							<tr>
								<th scope="row" id="rgconame_th"><span class="font_red">*</span>회사명</th>
								<td colspan="3" id="rgconame_td"><input type="text"
									class="inputTxt p100" name="user_coname" id="user_coname" /></td>
							</tr>
							
							<tr>
								<th scope="row"><span class="font_red">*</span>기업형태</th>
								<td colspan="3">
									<select type="text" class="inputTxt p100" name="user_businesstype" id="user_businesstype">
										<option value="" selected="selected">선택</option>
										<option>대기업</option>
										<option>SI</option>
										<option>솔루션</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<th scope="row" id="user_rpname_th"><span class="font_red">*</span>대표자명</th>
								<td colspan="3" id="user_rpname_td"><input type="text"
									class="inputTxt p100" name="user_rpname" id="user_rpname" /></td>
							</tr>
							
							<tr>

								<th><span class="font_red">*</span>사업자등록번호</th>
								<td colspan="3" ><input class="inputTxt"
									maxlength="10" type="text" id="user_cornm"
									placeholder="숫자만 입력하세요."
									name="user_cornm"></td>
							</tr>
			
							<tr>
								<th scope="row"><span class="font_red">*</span>우편번호</th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="user_zipcode" id="user_zipcode" /></td>

								<td><input type="button" value="주소 찾기"
									onclick="execDaumPostcode()"
									style="width: 80px; height: 25px;" /></td>
							</tr>
							
							<tr>
								<th scope="row"><span class="font_red">*</span>주소</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_address1" id="user_address1" /></td>
							</tr>
							<tr>
								<th scope="row">상세주소</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_address2" id="user_address2" /></td>
							</tr>
							<tr>
								<th scope="row" id="user_manager_th"><span class="font_red">*</span>인사 담당자명</th>
								<td colspan="3" id="user_manager_td"><input type="text"
									class="inputTxt p100" name="user_manager" id="user_manager" /></td>
							</tr>
							
							
							<tr>

								<th><span class="font_red">*</span>연락처</th>
								<td colspan="3" ><input class="inputTxt"
									maxlength="11" type="text" id="user_hp"
									placeholder="숫자만 입력하세요."
									name="user_hp"></td>
							</tr>
				</table>
					
					
					
					<table class="row">
						<tr>
							<th style="width:100px"; scope="row" >첨부파일(증빙서류)</br></br>
								<p>
									<span class="font_red">*</span> 사업자등록증 </br>&nbsp;&nbsp; 필수 첨부
								</p>
								
							</th>
								<td colspan="1">
									<!--multiple="multiple" -->
									<p style="color: #000000;"><span class="font_red">*</span>1. 사업자등록증 사본 1부 (고유 번호증)</p>
									<input type="file" name="file_nm" id="wfile_nm"><br><br></input>
									<p style="color: #000000;">2. 법인 인감증명서 1부 (3개월 이내 원본)</p>
									<input type="file" name="file_nm" id="wfile_nm"><br><br></input>
									<p style="color: #000000;">3. 법인 등기부등본 1부 (3개월 이내 원본)</p>
									<input type="file" name="file_nm" id="wfile_nm"><br><br></input>
									<p style="color: #000000;">4. 최근 2년간 재무제표 1부 (대차대조표, 손익계산서)</p>
									<input type="file" name="file_nm" id="wfile_nm"><br><br></input>
									<p style="color: #000000;">5. 기타 필요 서류</p>
									<input type="file" name="file_nm" id="wfile_nm"></input>
									<!-- <img v-if="file_nm !='' "src="/images/treeview/minus.gif" @click="minusClickEvent"> -->
								</td>
						</tr>	
					</table>
				
							
					
				<div class="btn_areaC mt30m" style="height: 50px; margin-top: 25px !important;">
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>승인(Y)</span></a> 
					<a href="" class="btnType blue" id="btnDelete" name="btn"><span>반려(R)</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="#" onclick="fcancleModal()" class="closePop"><span class="hidden">닫기</span></a>
	  </form>	
	</div>

<!-- 기업 관리 리스트 -->

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
								 	가입 기업관리
								</span> 
								<a href="../mngcmg/approve.do" class="btn_set refresh">
									새로고침
								</a>
								<p class="conTitle">
									<span>가입 기업관리 </span> 
									<span class="fr"> 
									 <select id="searchKey" name="searchKey" style="width: 80px;" >
									        <option value="" >전체</option>
											<option value="writer" >회사명</option>
											<option value="title" >대표자명</option>
									</select> 
									<input type="text" style="width: 150px; height: 28px;" id="sname" name="sname">
									<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검색</span></a>
										<select id="delyn" name="delyn" style="width: 80px;" onchange="filterList()">>
									        <option value="" >유저타입</option>
											<option value="1" >H:대기중</option>
											<option value="2" >C:승인</option>
											<option value="3" >R:반려</option>
										</select> 
									</span>
								</p>
								
                        
                        
                        
                        
						
						<div style="margin-bottom: 10px; 0 0 10px 0; text-align: center;">
							<p style="margin-bottom: 3px; font-weight: bold;" >※  유저 타입  ※</p>
							<span style="font-size: 12px;"> C : 승인 / R : 반려 / H : 대기중 </span>
						</div>
						
						<div class="compList">
							<table class="col">
								<caption></caption>
								<colgroup>
									<col width="5%">
									<col width="25%">
									<col width="10%">
									<col width="12%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
									<col width="8%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="col">회사명</th>
										<th scope="col">기업 형태</th>
										<th scope="col">등록일자</th>
										<th scope="col">대표자명</th>
										<th scope="col">기업  인사담당자명</th>
										<th scope="col">상태<br>(승인여부)</th>
										<th scope="col">유저타입</th>
									</tr>
								</thead>
								<tbody id="listcomp"></tbody>
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
	
	
	<div id="layer1" class="layerPop layerType2" style="width: 600px; border: 3px solid #3cb3eb;">
		<dl>
			<dt style="background-color: #3cb3eb">
				<strong style="color: #fbe441;">※ 승인 반려 사유를 입력해주세요.</strong>
			</dt>
			<dd class="content" style="padding:20px 20px; font-weight: bold;">
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
							<th scope="row">보내는 사람</th>
							<td colspan="3"><div>${loginID}</div></td>
						</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="msg_title" id="msg_title" placeholder="제목을 입력하세요"></td>
						</tr>
						<tr>
							<th scope="row">내용 <span class="font_red">*</span></th>
							<td colspan="3">
							    <textarea id="msg_content" name="msg_content" placeholder="내용을 입력하세요"> </textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">받는 사람</th>
							<td colspan="3"> <div id="msg_receiveID" name="msg_receiveID">${loginID}</div></td>
						</tr>
				  
				</tbody>
				</table>

				<p style="margin-top:20px;">반려 사유를 구체적으로 작성해주세요.</p>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSavemsg" name="btn" onclick="javascript:fn_msgsend();"><span>전송</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
</form>
</body>
</html>