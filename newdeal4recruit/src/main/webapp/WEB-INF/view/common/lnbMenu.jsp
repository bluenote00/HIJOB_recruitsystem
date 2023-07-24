<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="icon" type="image/png" href="../images/home/smile.png">



<!-- 우편번호 조회 -->

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${CTX_PATH}/js/popFindZipCode.js"></script>
	
<style>
	.LoginName {
		text-align: center;
		margin-left: -10px;
	}
	
	/* 스크롤 잠금 시, body에 overflow: hidden을 적용하여 스크롤을 감춥니다. */
    .scroll-lock {
      overflow: hidden;
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

<!-- 가입 정보 수정 모달 -->
<script type="text/javascript">	
/* 
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();
	
			var btnId = $(this).attr('id');
	
			switch (btnId) {
				case 'btnSave' :
					CompleteModification();
					break;	
			}
		});
	}
 */
	function RDmypage() {
		swal("비활성화 상태입니다.");
		
	}

	<%-- console.log('<%= session.getAttribute("userType") %>'); --%>
	
	function fcancleModal() {
	  gfCloseModal();
	  $("body").removeClass("scroll-lock");
	}
	
	/* 회원가입 정보 수정 모달창 실행 */
	function fModification() {
		
	  // loginID 값을 JSP에서 JavaScript로 전달
	  var loginID = '<%= session.getAttribute("loginID") %>';
	  console.log(loginID);
	  
	  window.scrollTo(0, 0);
	  
	  var div_cd;
	  $("#action").val("U");
	  console.log($("#action").val()); // 수정된 action 값 출력
	  $("body").addClass("scroll-lock");
	  // 모달 팝업
	  gfModalPop("#Modificationlayer");
	  modifiselectone(loginID);
	}
	
	/* 회원정보수정 validation */
	function ModificationVal() {
		var coname =$('#user_coname').val();
		var rpname = $('#user_rpname').val();
		var dtadr = $('#user_zipcode').val();
		var lgadr = $('#user_address1').val();
		var lgadr1 = $('#user_address2').val();
		var user_hp = $('#user_hp').val();
		var cornm = $('#user_cornm').val();
		var businesstype = $('#user_businesstype').val();
		var manager = $('#user_manager').val();
		//var wfile = $('#wfile_nm').val();
		
		if(coname.length < 1){
			
			swal("회사명을 입력하세요.").then(function() {
				$('#user_coname').focus();
			  });
			return false;
		}
		
		if(businesstype.length < 1){
			swal("기업형태를 선택하세요.").then(function() {
				$('#user_businesstype').focus();
			  });
			return false;
		}
		
		if(rpname.length < 1){
			swal("대표자명을 입력하세요.").then(function() {
				$('#user_rpname').focus();
			  });
			return false;
		}
		
		if(cornm.length < 1){
			swal("사업자등록번호를 입력하세요.").then(function() {
				$('#user_cornm').focus();
			  });
			return false;
		}
		
		
		if(dtadr.length < 1){
			swal("우편번호를 입력하세요.").then(function() {
				$('#user_zipcode').focus();
			  });
			return false;
		}
		
		if(lgadr.length < 1){
			swal("주소를 입력하세요.").then(function() {
				$('#user_address1').focus();
			  });
			return false;
		}
		
		if(manager.length < 1){
			swal("인사 담당자를 입력하세요.").then(function() {
				$('#user_manager').focus();
			  });
			return false;
		}
		
	/* 	if(lgadr1.length < 1){
			alert("상세주소를 입력하세요.");
			$('#user_address2').focus();
			return false;
		} */
		
		if(user_hp.length < 1){
			swal("연락처를 입력하세요.").then(function() {
				$('#user_hp').focus();
			  });
			return false;
		}
		
		return true;
		
		if(wfile.length < 1){
			swal("증빙서류를 첨부해주세요.").then(function() {
				$('#wfile_nm').focus();
			  });
			return false;
		}
	}
	
	/* 정보수정  완료 */
	function CompleteModification() {
		
	  $("#action").val("U");

	  /*전화번호 정규식*/
		var user_hpRules = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
		var user_hp = $("#user_hp").val();
		/*사업자번호 정규식*/
		var cornmRules = /^[0-9]{3}-?[0-9]{2}-?[0-9]{5}$/;
		var cornm = $("#user_cornm").val();

	  /* validation 체크 */
	  if (!ModificationVal()) {
	    return;
	  }
	  
	  if (!user_hpRules.test($("#user_hp").val())) {
	    swal("연락처를 확인해주세요.").then(function() {
	      $("#user_hp").focus();
	    });
	    return;
	  }
	  
	  if(!cornmRules.test($("#user_cornm").val())){
			swal("사업자등록번호를 확인해주세요.").then(function() {
				$("#user_cornm").focus();
	  });
		return false;
	  }

	  var resultCallback = function(reval) {
		  console.log( JSON.stringify(reval) );
		  
		  if(reval.returncval > 0) {
			  swal("변경 되었습니다.");
			  //gfCloseModal();
					
			  if($("#action").val() == "U") {
				  
			  } else {
				  alert("오류가 발생 되었습니다.");	
			  }
		  }
	  }
	  
	  var param = {
			    action: $("#action").val(),
			    user_coname: $("#user_coname").val(),
			    user_businesstype: $("#user_businesstype").val(),
			    user_rpname: $("#user_rpname").val(),
			    user_zipcode: $("#user_zipcode").val(),
			    user_address1: $("#user_address1").val(),
			    user_address2: $("#user_address2").val(),
			    user_cornm: $("#user_cornm").val(),
			    user_manager: $("#user_manager").val(),
			    user_hp: $("#user_hp").val(),
	  };

	  callAjax("/mngumg/mdification.do", "post", "json", false, param, resultCallback);
	  
	  fcancleModal();

	  //alert("수정 정보가 저장되었습니다.");
	}
	
	
	
	function modifiselectone(loginID) {
	  var param = {
	    loginID: loginID
	  };
	
	  var selectoncallback = function(returndata) {
	    console.log(JSON.stringify(returndata));
	    
	    var userData = returndata.modifisearch;
	    // 확인용 출력
	    console.log(returndata.modifisearch);
	
	    // 조회된 사용자 데이터를 폼에 채웁니다.
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
	  };
	
	  callAjax("/mngumg/modifiselectone.do", "post", "json", false, param, selectoncallback);
	}


	// 우편번호 api
	function execDaumPostcode(q) {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('user_zipcode').value = data.zonecode;
				document.getElementById("user_address1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("user_address2").focus();
			}
		}).open({
			q : q
		});
	}
</script>	

<script type="text/javascript">	
  /** OnLoad event */
  $(function() {
    //fSelectMngrWorkStat();
  });

  /* 
  function fSelectMngrWorkStat() {
  	
  	if ("${sessionScope.ofcDvsCod}" != "M") return;
  	
  	var resultCallback = function(data) {
  		fSelectMngrWorkStatResult(data);
  	};
  	
  	callAjax("/dashboard/selectMngrWorkStat.do", "post", "json", true, "", resultCallback);
  }
  
  function fSelectMngrWorkStatResult(data) {
  	
  	if (data.result == "SUCCESS") {
  		
  		var model = data.selectMngrWorkStat;
  		$("#B_CNT").text(model.B_CNT);
  		$("#B_ALM_CNT").text(model.B_ALM_CNT);
  		$("#D_CNT").text(model.D_CNT);
  		$("#D_ALM_CNT").text(model.D_ALM_CNT);
  		$("#M_CNT").text(model.M_CNT);
  		$("#M_ALM_CNT").text(model.M_ALM_CNT);
  	} else {
  		alert(data.resultMsg);
  	}	
  	
  }
   */
   
   var LogOutPopUp;

   function openPopUp() {
       LogOutPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
   }

   function closePopUp() {
       if (LogOutPopUp && !LogOutPopUp.closed) {
           LogOutPopUp.close();
       }
   }

   function naverLogout() {
       openPopUp();
       var retryCount = 0;
       var retryLimit = 3; // 최대 재시도 횟수 설정

       var retryInterval = setInterval(function() {
           if (retryCount < retryLimit) {
               if (LogOutPopUp && !LogOutPopUp.closed) {
                   closePopUp();
                   location.href = "/loginOut.do"; // 로그아웃 페이지로 이동
                   clearInterval(retryInterval); // 재시도 인터벌 종료
               } else {
                   openPopUp(); // 팝업이 닫혀있을 경우 다시 열기
                   retryCount++;
               }
           } else {
               clearInterval(retryInterval); // 재시도 횟수 초과하여 인터벌 종료
               console.log("팝업 닫힘 실패");
               // 추가적인 처리 또는 에러 핸들링을 수행할 수 있습니다.
           }
       }, 300); // 0.3초마다 재시도
   }
   
</script>

<h3 class="hidden">lnb 영역</h3>
<div id="lnb_area">
  <div class="logo">
    <div id="header">
      <a class="logo" href="/dashboard/dashboard.do"> <img src="/images/admin/login/logo_img4.png" alt="메인페이지" width="80%" height="55px" /></a>
    </div>  
  </div>
  <div class="login">
  		<div class="profile_pic">
    		<img src="/images/home/profile.png" class="LoginImg" alt="사진" />
    	</div>
    <%-- userNm 값이 null인 경우에는 user_coname을 보여줌 --%>
    <c:set var="userNm" value="${sessionScope.userNm}" />
	<c:set var="userConame" value="${sessionScope.user_coname}" />
	<c:choose>
	 	<c:when test="${empty sessionScope.userNm}">
        	<span class="LoginName">${sessionScope.user_coname} 님</span>
    	</c:when>
    	<c:otherwise>
        	<span class="LoginName">${sessionScope.userNm} 님</span>
    	</c:otherwise>
	</c:choose>


   
    <div class="btn_loginArea">
      <a href="#" onclick="naverLogout();" class="logout"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
    </div>
    
 
   <div class="loginsection_icon">
    <div class="loginsection_icon_info">
        <%-- userType이 'P'인 경우에는 아이콘을 표시하지 않음 --%>
        <c:choose>
            <c:when test="${sessionScope.userType != 'P'}">
                <a href="javascript:fModification()" id="ModificationBtn">
                    <p class="icon_imoji">👨‍💼</p>
                    <p class="icon_text">정보변경</p>
                </a>
            </c:when>
        </c:choose>
    </div>
    
    
     <div class="loginsection_icon_mypage">
  <c:choose>
    <c:when test="${sessionScope.userType == 'R' || sessionScope.userType == 'D'}">
      <a href="#" class="disabled" onclick="javascript:RDmypage(); return false; ">
        <p class="icon_imoji">🎁</p>
        <p class="icon_text">마이페이지</p>
      </a>
    </c:when>
    <c:otherwise>
      <a href="/myppage/myppage_main.do">
        <p class="icon_imoji">🎁</p>
        <p class="icon_text">마이페이지</p>
      </a>
    </c:otherwise>
  </c:choose>
</div>
    
   <div class="loginsection_icon_message">
   <a href="/mypmsg/message.do"> 
    	<p class="icon_imoji">📭</p>
    	<p class="icon_text">쪽지</p>
    	</a>
    </div>
    
        <div class="loginsection_icon_alram">
    	 <a href="/mypair/alert.do">
    	<p class="icon_imoji">🔔</p>
    	<p class="icon_text">알람</p>
    	</a>
    </div>
    
   	</div>	
    	
  </div>
  
  
  
  <ul class="lnbMenu">
    <c:forEach items="${sessionScope.usrMnuAtrt}" var="list">
      <li>
        <dl>
          <dt>
            <a class="lnbBtn ${list.mnu_ico_cod}" href="#">${list.mnu_nm}<em></em></a>
          </dt>
          <dd>
            <c:forEach items="${list.nodeList}" var="i">
              <c:set var="urls" value="${fn:split(i.mnu_url, '/')}" />
              <c:choose>
                <c:when test="${fn:indexOf(urls[fn:length(urls)-1], '=') > -1}">
                  <c:set var="url" value="${fn:split(urls[fn:length(urls)-1], '=')}" />
                  <a href="${i.mnu_url}" id="lnb_${url[fn:length(url)-1]}">- ${i.mnu_nm}</a>
                </c:when>
                <c:otherwise>
                  <c:set var="url" value="${fn:split(urls[fn:length(urls)-1], '.')}" />
                  <a href="${i.mnu_url}" id="lnb_${url[0]}">- ${i.mnu_nm}</a>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </dd>
        </dl>
      </li>
    </c:forEach>
  </ul>
  <div style="clear: both;"></div>
</div>

<!-- 가입 정보 모달팝업 -->


	<div id="Modificationlayer" class="layerPosition layerPop ModifilayerType2" style="width: 600px; top: 10px; position: fixed;" >
      <form id="ModificationForm" action="" method="" >
	      <input type="hidden" name="action" id="action" value="">
	      <input type="hidden" name="ckIdcheckreg" id="ckIdcheckreg" value=""/>
	      <input type="hidden" name="ckEmailcheckreg" id="ckEmailcheckreg" value=""/>	
	      <input type="hidden" name="ckEmailcheckreg" id="ckEmailcheckreg" value=""/>	

	      
		<dl>
			<dt style="text-align: center;">
				<strong style="font-size:150%;">기업회원 회원정보 변경</strong>
			</dt>
			<dd class="content" style="padding: 10px 20px;">
				<!-- <div class="btn_areaC">
					<a href="javascript:instaffRegister();" class="btnType blue" id="register_instaff"><span>일반회원</span></a>
					<a href="javascript:outstaffRegister();" class="btnType " id="register_outstaff"><span>기업회원</span></a>
				</div> -->
				<div style="font-size: 90%; margin-bottom: 5px;">
					<span class="font_red">
						&nbsp;
						*
					</span>
					<strong>
						표시 항목은 필수 입력 항목입니다.
					</strong>
					</br>
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
							<!-- <tr>
								<th scope="row"><span class="font_red">*</span>비밀번호</th>
								<td colspan="3"><input type="password"
									placeholder="영문, 숫자 조합으로 6~15자리 " class="inputTxt p100"
									name="password" id="registerPwd" /></td>
							</tr>

							<tr>
								<th scope="row">
									<span class="font_red">*</span>비밀번호 확인</th>
								<td colspan="3"><input type="password"
									placeholder="비밀번호를 한번 더 입력하세요."
									class="inputTxt p100" name="password1" id="registerPwdOk"/></td>
							</tr> -->
							
							
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
					<a href="#" class="btnType blue"
						id="modibtnSave" name="btn" onclick="CompleteModification();"> <span>변경 완료</span>
					</a> 
					<a href="javascript:fcancleModal()" class="btnType gray" id="btnCloseLsmCod" name="btn" >
						<span>
							취소
						</span>
					</a> <br><br><br>
				</div>
			</dd>
		</dl>
		<a href="#" onclick="fcancleModal()" class="closePop"><span class="hidden">닫기</span></a>
	  </form>	
	</div>

