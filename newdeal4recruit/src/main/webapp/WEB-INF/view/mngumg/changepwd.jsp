<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>하이잡 :: 비밀번호 변경</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<style>

	#wrap_area {
   		position: relative;
	}

	#container ul li.contents {
	    padding: 0 20px;
	    background: #fff;
	    width: 800px;
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
	var loginID = '<%= request.getAttribute("loginID") %>';

	/* 비밀번호 확인 */
	function pwdconfirm() {
	  var userInputPassword = document.getElementById('currentregisterPwd').value; // 사용자가 입력한 현재 비밀번호
	
	  // AJAX를 통해 서버에 비밀번호 확인 요청
	  var param = {
	    loginID: loginID,
	    userInputPassword: userInputPassword
	  };
	
	  var selectoncallback = function(returndata) {
	    //console.log(JSON.stringify(returndata));
	
	    var userData = returndata.passwordconfirm;
	    //console.log(userData);
	
	    if (userData && userData.password === userInputPassword) {
	      console.log('비밀번호가 일치합니다.');
	      CompleteChangePwd(); // 비밀번호가 일치하는 경우에만 CompleteChangePwd() 함수 호출
	    } else {
	      console.log('비밀번호가 일치하지 않습니다.');
	      swal("비밀번호가 일치하지 않습니다.").then(function() {
	        $('#currentregisterPwd').focus();
	      });
	    }
	  };
	
	  callAjax("/mngumg/pwdconfirm.do", "post", "json", false, param, selectoncallback);
	}

	/* 비밀번호 변경 완료 */
	function CompleteChangePwd() {
	  $("#action").val("U");	
	  var crtpwd = $('#currentregisterPwd').val();
	  var rgpwd = $('#newregisterPwd').val();
	  var rgpwdok = $('#newregisterPwdOk').val();
	
	  if (crtpwd.length < 1) {
	    swal("현재 비밀번호를 입력하세요.").then(function() {
	      $('#currentregisterPwd').focus();
	    });
	    return false;
	  }
	
	  if (rgpwdok.length < 1) {
	    swal("새로운 비밀번호를 입력하세요.").then(function() {
	      $('#newregisterPwd').focus();
	    });
	    return false;
	  }
	
	  if (rgpwdok.length < 1) {
	    swal("비밀번호 확인을 입력하세요.").then(function() {
	      $('#newregisterPwdOk').focus();
	    });
	    return false;
	  }
	
	  if (rgpwd != rgpwdok) {
	    swal("새로운 비밀번호가 맞지 않습니다.").then(function() {
	      $('#newregisterPwd').focus();
	    });
	    return false;
	  }
	
	  var passwordRules = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,25}$/;
	  if (!passwordRules.test(rgpwd)) {
	    swal("비밀 번호는 영문, 숫자 조합으로 6~15자리를 사용해야 합니다.").then(function() {
	      $('#newregisterPwd').focus();
	    });
	    return false;
	  }
	
	  var param = {
			  action : $("#action").val(), 
			  password : $("#newregisterPwdOk").val(),
	  }
	
	  $.ajax({
		  url: "/mngumg/changepassword.do",
		  type: "POST",
		  dataType: "json",
		  data: param,
		  success: function(response) {
		    if (response.returncval > 0) {
		      if ($("#action").val() == "U") {
		        alert("비밀번호가 변경되었습니다.");
		        $('#passwordChangeForm')[0].reset();
		      } else {
		        alert("오류가 발생되었습니다.");
		      }
		    } else {
		      alert("오류가 발생되었습니다.");
		    }
		  },
		  error: function(xhr, status, error) {
		    alert("오류가 발생되었습니다.");
		  }
		});
	}
</script>



</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="action"  name="action"  />
	
	
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
								class="btn_nav bold">마이페이지</span> <span class="btn_nav bold">비밀번호 변경
								</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>비밀번호 변경</span>
						</p>
						

						<div class="paging_area"  id="noticePagination" style="height: 250px; display: flex; justify-content: center; align-items: center; line-height: 31px;">
							<form id="passwordChangeForm" action="" method="" style="max-width: 400px; margin: 0 auto;">
							    <div class="form_group" style="width: 250px;">
							        <label for="currentPassword" style="font-weight: bold; display: flex; justify-content: left;">현재 비밀번호</label>
							        <input type="password" placeholder="현재 비밀번호를 입력하세요 " class="inputTxt p100" name="currentpassword" id="currentregisterPwd"/>
							        <label for="newPassword" style="font-weight: bold; display: flex; justify-content: left;">새로운 비밀번호</label>
							        <input type="password" placeholder="새로운 비밀번호를 입력하세요 " class="inputTxt p100" name="newrpassword" id="newregisterPwd"/>
							        <label for="confirmPassword" style="font-weight: bold; display: flex; justify-content: left;">새로운 비밀번호 확인</label>
							        <input type="password" placeholder="새로운 비밀번호를 한번 더 입력하세요 " class="inputTxt p100" name="newrpasswordOk" id="newregisterPwdOk"/>
							    </div>
							    <div class="btn_areaC mt30m" style="height: 40px; margin-top: 10px !important;">
									<a href="javascript:pwdconfirm()" class="btnType blue" id="btnSave" name="btn"><span>비밀번호 변경</span></a> 
								</div>
							</form>

						</div>
						
                     
					</div> <!--// content -->
					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>