<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>하이잡 :: Login</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="${CTX_PATH}/css/admin/login.css" />


<!-- (1) LoginWithNaverId Javscript SDK -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<!-- 우편번호 조회 -->

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${CTX_PATH}/js/popFindZipCode.js"></script>
	<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>

<script type="text/javascript" src="${CTX_PATH}/js/login_pub.js"></script>
<style>
	#layer1 th {
		font-size: 12px;
	}
	
	#ifile p {
		font-size: 11px;
	}
	

.image_wrap  {
	position: relative;
	background-position: center center;
	background-size: cover;
	object-fit: fill;
	width: 100%;
    height: 100%;
   	object-fit: cover;
	background-size: 100% auto;
	-ms-overflow-style: none;
	overflow: hidden;
}

.image {
	background-image: url("${CTX_PATH}/images/home/background_login.jpg");
	background-size: cover;
	background-position: center center;
	display: inline-block;
	object-fit: fill;
	background-size: 100% auto;
   	filter: brightness(70%);
   	-ms-overflow-style: none;
   	overflow: hidden;
}

.bg {
	position: relative;
	width: 2000px;
	height: 1000px;
	object-fit: cover;
	background-size: 100% auto;
	-ms-overflow-style: none;
	overflow: hidden;
}

@-webkit-keyframes zoom-a {
	0% { background-size: 100% auto; }
	100% { background-size: 120% auto; }
}
@-moz-keyframes zoom-a {
	0% { background-size: 100% auto; }
	100% { background-size: 120% auto; }
}
@-o-keyframes zoom-a {
	0% { background-size: 100% auto; }
	100% { background-size: 120% auto; }
}
@keyframes zoom-a {
	0% { background-size: 100% auto; }
	100% { background-size: 120% auto; }
}
.type-a {
  -webkit-animation: zoom-a 10s linear infinite alternate; /* Safari 4+ */
  -moz-animation:    zoom-a 10s linear infinite alternate; /* Fx 5+ */
  -o-animation:      zoom-a 10s linear infinite alternate; /* Opera 12+ */
  animation:         zoom-a 10s linear infinite alternate; /* IE 10+, Fx 29+ */
}
@-webkit-keyframes zoom-b {
	0% {
    -ms-transform: scale(1, 1);
    transform: scale(1, 1) translateZ(1px);
  }
	100% {
    -ms-transform: scale(1.2, 1.2);
    transform: scale(1.2, 1.2) translateZ(1px);
  }
}
@-moz-keyframes zoom-b {
	0% {
    -ms-transform: scale(1, 1);
    transform: scale(1, 1) translateZ(1px);
  }
	100% {
    -ms-transform: scale(1.2, 1.2);
    transform: scale(1.2, 1.2) translateZ(1px);
  }
}
@-o-keyframes zoom-b {
	0% {
    -ms-transform: scale(1, 1);
    transform: scale(1, 1) translateZ(1px);
  }
	100% {
    -ms-transform: scale(1.2, 1.2);
    transform: scale(1.2, 1.2) translateZ(1px);
  }
}
@keyframes zoom-b {
	0% {
    -ms-transform: scale(1, 1);
    transform: scale(1, 1) translateZ(1px);
  }
	100% {
    -ms-transform: scale(1.2, 1.2);
    transform: scale(1.2, 1.2) translateZ(1px);
  }
}
.type-b {
  -webkit-animation: zoom-b 10s linear infinite alternate; /* Safari 4+ */
  -moz-animation:    zoom-b 10s linear infinite alternate; /* Fx 5+ */
  -o-animation:      zoom-b 10s linear infinite alternate; /* Opera 12+ */
  animation:         zoom-b 10s linear infinite alternate; /* IE 10+, Fx 29+ */
}

.login_head {
	top: -850px;
    left: 500px;
	color: #ffff;
	position: relative;
    font-size: 120px;
	letter-spacing: -10px;
    font-weight: 900;
    padding: .25em 0 .325em;
    display: block;
    margin: 0 auto;
    text-shadow: 0 0 80px rgba(255,255,255,.5);
}

.background_board {
	z-index: 10;
	position: relative;
}

::-webkit-scrollbar {
    display: none;
}

.login_section {
	top: 500px;
    left: 670px;
    position: absolute;
    border-radius: 15px;
    width: 500px;
    height: 375px;
    background-color: #a9a9a980;
    text-align: center;
}


.login_pw_textarea {
	margin-top: 40px;
	margin-left: 70px;
	margin-right: 70px;
	text-align: center;
}

.login_textarea {
	margin-bottom: 10px;
}

.login_pw_textarea i {
	font-size: 25px;
	margin-right: 15px;
	vertical-align: middle;
}

#EMP_ID, #EMP_PWD {
	border-radius: 10px;
	width: 300px;
	height: 40px;
	background-color: #49494980;
}

.login_pw_textarea input::placeholder {
    color:  #ffffff;
}

.login_textarea input {
	padding-left: 10px;
}

.pw_textarea input {
	padding-left: 10px;
}

.login_section_etc {
	display: flex;
	margin-top: 10px;
	margin-left: 30px;
	margin-bottom: 20px;
	font-size: 13px;
	justify-content: center;
}

.id_save {
	margin-right: 10px;
}



</style>


<script type="text/javascript">

var check;



/* OnLoad Event */
$(document).ready(function() {
	$("#confirm").hide();
	$("#loginRegister").hide();
	$("#loginEmail").hide();
	$("#loginPwd").hide();
	
	var cookie_user_id = getCookie('EMP_ID');
	if (cookie_user_id != "") {
		$("#EMP_ID").val(cookie_user_id);
		$("#cb_saveId").attr("checked", true);
	}

	$("#EMP_ID").focus();
	
	//init();
	
});



function fcancleModal(){
	gfCloseModal();
}

/* 회원가입 모달창 실행 */
function fRegister() {
	var div_cd;
	$("#action").val("I");
	// 모달 팝업
	gfModalPop("#layer1");
	outstaffRegister();
}


 /* function init() {
	check = new Vue({
		el: '#layer1',
		data : {
			langitems: [],
			langitems1: [],
			langitems2: [],
			langitems3: [],	
			langitemss: [],
			langitemarea1: [],
			langitemarea2: [],
			langitemarea3: [],
		}
	})
 } */

/*  체크리스트 콜백함수
 function checklistResult(data){ 	
	
	callAjax시 로그인 여부 확인 하므로 ajax 함수 직접 작성
 	$.ajax({
		url : '/checklist.do',
		type : 'post',
		data : data,
		dataType : 'json',
		async : true,
		success : function(data) {
			check.check = [];
			check.langitems = data.listlistCod;
			check.langitems1 = data.weblistCod;
			check.langitems2 = data.dblistCod;
			check.langitems3 = data.wslistCod;
			check.langitemss = data.sklcdlistCod;
			check.langitemarea1 = data.areacdlistCod;
			check.langitemarea2 = data.areacdlistCod;
			check.langitemarea3 = data.areacdlistCod;
			}
		});
} */
 
$("input[v-model=chkbox]:checked").each(function(){
	var chk = $(this).val();
})

var chk_arr = [];
$("input[v-model=chkbox]:checked").each(function(){
	var chk = $(this).val();
	chk_arr.push(chk);
})



/*기업 고객 회원가입 폼 초기화*/
function outstaffRegister(){
	
	var currentDate = new Date();
	
	$("#user_no").hide();  //회원번호
	$("#registerId").val("");  //사용자ID(이메일)
	$("#user_type").hide(); //사용자구분   A:관리자        C:기업       P:취준생
	$("#user_type_li").hide(); //
	$("#user_hp").val(""); //연락처
	//$("#user_regdate").val(""); //가입일자
	$("#user_businesstype").val(""); //기업형태
	$("#user_coname").val(""); //회사명
	$("#user_rpname").val(""); //대표자명
	$("#user_cornm").val(""); //사업등록번호
	$("#user_zipcode").val(""); //우편번호
	$("#user_address1").val(""); //도로명주소
	$("#user_address2").val(""); //상세주소
	$("#registerPwd").val(""); // 비밀번호
	$("#registerPwdOk").val(""); // 비밀번호 확인
	$("#user_manager").val(""); //인사담당자
	$("#user_status").hide(); //상태(승인여부)
	$("#user_deccnt").hide(); //신고건수
	
	$("#div_cd").val("BusinessMember"); //

	$("#ckIdcheckreg").val("0"); //
	
	$("#checktable").hide(); //
	
	console.log($("#div_cd").val());

	/* console.log($("#user_type").val());
	console.log($("#div_cd").val()); */
}



/* 아이디/비밀번호 찾기 모달창 실행 */
function findIdPwd() {

	// 모달 팝업
	gfModalPop("#layer2");
	
}


/* 회원가입 validation */
function RegisterVal(){
	  
	var div_cd = $('#div_cd').val();
	var user_type = $('#user_type').val();
	var rgid =$("#user_no").val();
	var rgid = $('#registerId').val();
	var rgpwd = $('#registerPwd').val();
	var rgpwdok = $('#registerPwdOk').val();
	var coname =$('#user_coname').val();
	var rgname = $('#registerName').val();
	var rpname = $('#user_rpname').val();
	//var regdate = $('#user_regdate').val();
	var dtadr = $('#user_zipcode').val();
	var lgadr = $('#user_address1').val();
	var lgadr1 = $('#user_address2').val();
	var user_hp = $('#user_hp').val();
	var cornm = $('#user_cornm').val();
	var businesstype = $('#user_businesstype').val();
	var manager = $('#user_manager').val();
	var wfile = $('#wfile_nm').val();

	if(rgid.length < 1){
		swal("아이디를 입력하세요").then(function() {
			$('#registerId').focus();
		  });
		return false;
	}
	
	if(rgid.length < 1){
		swal("아이디를 입력하세요").then(function() {
			$('#registerId').focus();
		  });
		return false;
	}
	
	if(rgpwd.length < 1){
		swal("비밀번호를 입력하세요.").then(function() {
			$('#registerPwd').focus();
		  });
		return false;
	}
	
	if(rgpwdok.length < 1){
		swal("비밀번호 확인을 입력하세요.").then(function() {
			$('#registerPwdOk').focus();
		  });
		return false;
	}
	
	if(rgpwd != rgpwdok){
		swal("비밀번호가 맞지 않습니다.").then(function() {
			$('#registerPwd').focus();
		  });
		return false;
	}
	
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
/*loginID 중복체크*/
function loginIdCheck(){
	
	var data = {"loginID" : $("#registerId").val()};
	
	var idRules =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var id = $("#registerId").val();

	/*callAjax시 로그인 여부 확인 하므로 ajax 함수 직접 작성*/
	$.ajax({
		url : '/check_loginID.do',
		type : 'post',
		data : data,
		dataType : 'text',
		async : true,
		success : function(data) {
			if($("#registerId").val()==""){
				//console.log("입력 아이디 없음");
				swal("아이디를 입력해주세요.").then(function(){
					$("#registerId").focus();
				});
				$("#ckIdcheckreg").val("0");
			}
			 else if (data==1){
				console.log("아이디 있음");
				swal("중복된 아이디가 존재합니다.").then(function(){
					$("#registerId").focus();
				});
				console.log(data);
				$("#ckIdcheckreg").val("0");
			} else if(!idRules.test($("#registerId").val())){
				swal('아이디는 이메일 형식으로 입력해주세요.\n\n ex) hijob@hijob.com').then(function(){
				    $("#registerId").focus();
				});
				$("#ckIdcheckreg").val("0");
				return false;
			} else if(data == 0){
				console.log("아이디 없음");
				swal("사용할 수 있는 아이디 입니다.");
				$("#ckIdcheckreg").val("1");
			}
		}
	});
}

/*회원가입 버튼 아이디 중복 체크*/
function loginIdCheckComplete(){
	
	var data = {"loginID" : $("#registerId").val()}

	
	/*이메일 정규식*/
	var idRules = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var id = $("#registerId").val();

	/*callAjax시 로그인 여부 확인 하므로 ajax 함수 직접 작성*/
	$.ajax({
		url : '/check_loginID.do',
		type : 'post',
		data : data,
		dataType : 'text',
		async : false,
		success : function(data) {
			if (data == 1){
				$("#ckIdcheckreg").val("0"
						
				);
				console.log("아이디 있음");
				return false;
			} else if(!idRules.test($("#registerId").val())){
				$("#ckIdcheckreg").val("0");
				return false;
			}
		}
	});
	
	/* $.ajax({
		url : '/check_email.do',
		type : 'post',
		data : data,
		dataType : 'text',
		async : false,
		success : function(data) {
			if(data == 1){
				$("#ckEmailcheckreg").val("0");
				console.log("이메일 있음");
				console.log(data);
				return false;
			} else {
				$("#ckEmailcheckreg").val("1");
				console.log(data);
				console.log("이메일 없음");
			}
			
		}
	}); */
	
	
}






/* 회원가입  완료*/
function CompleteRegister() {
	
	var param = $("#RegisterForm").serialize();
	/*패스워드 정규식*/
	var passwordRules = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,25}$/;
 	var password = $("#registerPwd").val();
 	
	
	/*전화번호 정규식*/
	var user_hpRules = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
	var user_hp = $("#user_hp").val();
	/*사업자번호 정규식*/
	var cornmRules = /^[0-9]{3}-?[0-9]{2}-?[0-9]{5}$/;
	var cornm = $("#user_cornm").val();
	

	//console.log(div_cd);
	/* validation 체크 */
	if(!RegisterVal()){
		return;
	}
		
	loginIdCheckComplete();
			 
	if (RegisterForm.ckIdcheckreg.value == "0"){
		swal("아이디 중복확인을 진행해주세요.").then(function() {
			$("#registerId").focus();
		  });
	} else if(!passwordRules.test($("#registerPwd").val())){
		swal('비밀 번호는 영문, 숫자 조합으로 6~15자리를 사용해야 합니다.').then(function() {
			$("#registerPwd").focus();
		  });
		return false;
		
	}  else if(!cornmRules.test($("#user_cornm").val())){
		swal("사업자등록번호를 확인해주세요.").then(function() {
			$("#user_cornm").focus();
		  });
		return false;
	} else if(!user_hpRules.test($("#user_hp").val())){
		swal("연락처를 확인해주세요.").then(function() {
			$("#user_hp").focus();
		  });
		return false;
	} else{
	
		var resultCallback = function(data) {
		fSaveRegister(data);
		};
	
	callAjax("/register.do", "post", "json", true, param, resultCallback);
	}
	
	fcancleModal();
}



/* 회원 가입 저장 콜백함수 */
function fSaveRegister(data) {

	if (data.result == "SUCCESS") {
		swal(data.resultMsg);
		//gfCloseModal();
	} else {
		alert(data.resultMsg);
		return false;
	}
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


/* 로그인 validation */
function fValidateLogin() {

	var chk = checkNotEmpty([ [ "EMP_ID", "아이디를 입력해 주세요." ],
			[ "EMP_PWD", "비밀번호를 입력해 주세요." ] ]);

	if (!chk) {
		return;
	}

	return true;
}

/* 로그인 */
function fLoginProc() {
	if ($("#cb_saveId").is(":checked")) { // 저장 체크시
		saveCookie('EMP_ID', $("#EMP_ID").val(), 7);
	} else { // 체크 해제시는 공백
		saveCookie('EMP_ID', "", 7);
	}

	// vaildation 체크
	if (!fValidateLogin()) {
		return;
	}

	var resultCallback = function(data) {
		fLoginProcResult(data);
	};

	callAjax("/loginProc.do", "post", "json", true, $("#myForm")
			.serialize(), resultCallback);
}

/* 로그인 결과 */
function fLoginProcResult(data) {

	//var lhost = data.serverName;

	if (data.result == "SUCCESS") {
		location.href = "${CTX_PATH}/dashboard/dashboard.do";
	} else {

		$("<div style='text-align:center;'>" + data.resultMsg + "</div>")
				.dialog({
					modal : true,
					resizable : false,
					buttons : [ {
						text : "확인",
						click : function() {
							$(this).dialog("close");
							$("#EMP_ID").val("");
							$("#EMP_PWD").val("");
							$("#EMP_ID").focus();
						}
					} ]
				});
		$(".ui-dialog-titlebar").hide();
	}
}


/*이메일 기능  (아이디 있는지 없는지 체크)*/
function SendEmail() {
	var data = {
		"user_email" : $("#emailText").val(),
		/*"data-code" : $("#emailText").attr("data-code")*/
	};

	$.ajax({
		url : "/selectFindInfoId.do",
		type : "post",
		dataType : "json",
		async : false,
		data : data,
		success : function(flag) {
				if ($("#emailText").val() == "") {
					swal("이메일을 입력해주세요.");
			}	else if (flag.result == "FALSE") {
					swal("존재하지 않는 이메일 입니다.");
				}
				else if (flag.result == "SUCCESS") {
					swal("해당 이메일로 인증번호를 전송하였습니다.");
					
					$("#authNumId").val(flag);
					$("#confirm").show();
					findMailSendId();
			} 
		}
	});
}

/*ID 찾기 이메일 전송*/
function findMailSendId(){
	var data = {
			"email" : $("#emailText").val(),
			"authNumId" : $("#authNumId").val()
		};
	$.ajax({
		url : "/sendmail.do",
		type : "post",
		dataType : "json",
		async : true,
		data : data,
		success : function(flag) {
				$("#authNumId").val(flag.authNumId);
		},
		error : function(request,status,error){
			swal("실패");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}

/* 이메일 인증 */
function SendComplete() {
 	var inputNum = $("#emailNum").val();
	var emailNum = $("#authNumId").val(); 
	console.log(emailNum);
	
	if (inputNum.length < 1) {
		swal("인증번호를 입력해주세요.");
		return false;
		
	} else if (emailNum != inputNum) {
		swal("인증번호가 틀렸습니다.");
		return false;
		}
	
	 else if (emailNum == inputNum) {
		swal("인증 되었습니다.");
		
		// 아이디 메일 전송 함수호출
		findId();
	}
}

/* 아이디 뜨게 하는 */
var findId = function() {
	var data = {
		"user_email" : $("#emailText").val()
	};
	$.ajax({
		url : '/selectFindInfoId.do',
		type : 'post',
		data : data,
		dataType : 'json',
		async : false,
		success : function(flag) {
			// 모달 or span 
			console.log(flag);
			swal("귀하의 아이디는  " + flag.resultModel.loginID + " 입니다");
			$("#emailText").val('');
			$("#confirm").hide();
			$("#emailText").val('');
			$("#authNumId").val('');
			$("#emailNum").val('');
			$("#authNumId").val('');
		gfCloseModal();
		}
	});
}

/* 비밀번호 찾기에서 아이디 체크하는 창(가입된 아이디가 알람창으로) */
function RegisterIdCheck(){
	var loginid = $("#emailIdText").val();

	
	var data = {
			"loginID" :loginid
	};
	console.log(data);
	
	$.ajax({
		url : "/registerIdCheck.do",
		type : "post",
		dataType : "json",
		async : false,
		data : data,
		success : function(data){
			if(loginid.length < 1){
				swal("아이디를 입력해주세요.");
				$("#loginEmail").hide();
			}
		
			else if (data.result == "SUCCESS"){
				
				swal("아이디가 존재합니다.");
				$("#loginEmail").show();
			}else{
				//console.log("data : " + JSON.stringify(data));
				swal("아이디가 존재하지 않습니다.");
				$("#loginEmail").hide();
			}
			
		}
		
	});
}

/* 이메일 기능 (비밀번호 기능)*/
function SendPwdEmail() {
	
	var data = {
		user_email : $("#emailPwdText").val(),
		loginID : $("#emailIdText").val(),
/* 		"data-code" : $("#emailPwdText").attr("data-code") */

	};
	
	console.log(data);
	
	
	
	$.ajax({
		url : "/selectFindInfoPw.do",
		type : "post",
		dataType : "json",
		async : false,
		data : data,
		success : function(flag) {
			
			
			if ($("#emailPwdText").val() == "") {
				swal("이메일을 입력해주세요.");
			} else if (flag.result == "FALSE") {
				swal("이메일이 틀렸습니다.");
				console.log("flag : " + JSON.stringify(flag));
			} else if (flag.result == "SUCCESS") {
				console.log("flag : " + JSON.stringify(flag));
				swal("해당 이메일로 인증번호를 전송하였습니다.");
				$("#authNumPwd").val(flag);
				$("#loginPwd").show();
				findMailSendPwd();
			}

		}
	});
}

/*비밀번호 찾기 이메일 전송*/
function findMailSendPwd(){
	var data = {
			"emailPwd" : $("#emailIdText").val(),
			"email" : $("#emailPwdText").val(),
			"authNumIdPwd" : $("#authNumPwd").val()
		};
	$.ajax({
		url : "/sendmail.do",
		type : "post",
		dataType : "json",
		async : true,
		data : data,
		success : function(flag) {
				$("#authNumPwd").val(flag.authNumId);
		},
		error : function(request,status,error){
			swal("실패");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}

/* function pwdCheck(){
	var email = $("#emailPwdText");
	
	if(email.length < 1){
		alert("이메일을 입력해주세요.");
	}
}
 */
 
/* 이메일 비밀번호 인증 */
function SendCompletePwd() {
	var inputPwd = $("#emailPwdNum").val();
	var emailPwdNum = $("#authNumPwd").val();
	if (inputPwd.length < 1) {
		swal("인증번호를 입력해주세요.");
		return false;
	} else if (emailPwdNum != inputPwd) {
		swal("인증번호가 틀렸습니다.");
		return false;
	} else if (emailPwdNum == inputPwd) {
		swal("인증번호가 맞습니다.");
		$("#authNumPwd").val('');

		// 비밀번호 호출하는 함수
		findPwd();
	}
}


/* 비밀번호 뜨게 하는 창 */
var findPwd = function() {
	var data = {
		"loginID" : $("#emailIdText").val(),
		"user_email" : $("#emailPwdText").val()
	};
	$.ajax({
		url : '/selectFindInfoPw.do',
		type : 'post',
		data : data,
		dataType : 'json',
		async : false,
		success : function(flag) {
			swal("귀하의 비밀번호는  " + flag.resultModel.password + " 입니다");
			$("#loginEmail").hide();
			$("#loginPwd ").hide();
			$("#emailIdText").val('');
			$("#emailPwdText").val('');
			$("#emailPwdNum").val('');
			gfCloseModal();
		}
	});
}

/* 아이디 찾기 버튼 클릭 이벤트 */
function fSelectId() {

	gfModalPop("#layer2");
	$("#registerEmailId").show();
	$("#loginRegister").hide();
	$("#loginEmail").hide();
	$("#loginPwd").hide();
	$("#emailText").val('');
}

/* 비밀번호 찾기 버튼 클릭 이벤트 */
function fSelectPwd() {

	$("#registerEmailId").hide();
	$("#confirm").hide();
	$("#loginRegister").show();
	$("#loginEmail").hide();
	$("#loginPwd").hide();
	$("#emailIdText").val('');
	gfModalPop("#layer2");
}

/* 아이디 찾기 메일 인증하기 버튼 클릭 이벤트 */
function fSelectIdOk() {
	$("#emailOk").on("click", function() {
		swal("인증이 완료 되었습니다.")
	});
}

/** ID 조회 */
function fSelectData() {
	var resultCallback = function(data) {
		fSelectDataResult(data);
	};
	callAjax("/selectFindInfoId.do", "post", "json", true, $("#modalForm")
			.serialize(), resultCallback);
}

/** PW 조회 */
function fSelectDataPw() {
	var resultCallback = function(data) {
		fSelectDataResultPw(data);
	};

	callAjax("/selectFindInfoPw.do", "post", "json", true, $("#modalForm2")
			.serialize(), resultCallback);
}

/** pw 저장 */
function fSaveData() {

	var resultCallback = function(data) {
		fSaveDataResult(data);
	};

	callAjax("/updateFindPw.do", "post", "json", true, $("#modalForm2")
			.serialize(), resultCallback);
}

/** 데이터 저장 콜백 함수 */
function fSaveDataResult(data) {
	if (data.result == "SUCCESS") {
		// 응답 메시지 출력
		swal(data.resultMsg);
		location.href = "/login.do";
	} else {
		// 오류 응답 메시지 출력
		alert(data.resultMsg);
	}
}

	
</script>
</head>
<body>
	
	
	<form id="myForm" action="" method="post">
	

	  	 <!-- 배경 구역 -->
<div class="image_wrap">
  				<div class="bg image type-b"></div>
		</div>		
	
	<div class="login_head">
		2023 채용박람회
	</div>

  	           
  	      
  	           
  	         
  	           
	 <!-- 로그인 폼 구역 -->
	     <div class="login_section">    
				
				<div class="login_pw_textarea">
					<div class="login_textarea">
								<label for="user_id"><i class="fa-solid fa-user"></i></label>
						 			<input type="text" id="EMP_ID" name="lgn_Id" placeholder="아이디" onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}" />
					</div>
					
					<div class="pw_textarea">
							<label for="user_pwd"><i class="fa-solid fa-lock"></i></label> <input type="password" id="EMP_PWD" name="pwd" placeholder="비밀번호" onfocus="this.placeholder='비밀번호'; return true" onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}" />
					</div>
		

			
			
					<div class="login_section_etc">
								<p class="member_info">
								<input type="checkbox" id="cb_saveId" name="" onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}">
						
								<span class="id_save">ID저장</span> 
									<a href="javascript:fRegister();" id="RegisterBtn" 	name="modal"><strong>[회원가입]</strong></a> 
									<a href="javascript:findIdPwd();"><strong>[아이디/비밀번호 찾기]</strong></a>
						</div>
			
		
					<a class="btn_login" href="javascript:fLoginProc();" id="btn_login"><strong>Login</strong></a>
			
			<div id="snslogins">
				<span class="sc-llYSUQ gylOiQ">
					<div class="line"></div>
					<span class="sc-iJKOTD lgasjq">개인 회원 SNS로 간편 가입 및 로그인</span>
					<div class="line"></div>
				</span>
				<div class="sc-giYglK fedtzx">
					<!-- 네이버 로그인  -->
                	<div id="naverIdLogin"></div>

                	<!-- 카카오 로그인  -->
                	<a id="kakao-login-btn" href="#" onclick="openPopupAndRedirect();">
    					<img src="${CTX_PATH}/images/admin/login/kakao_login_medium.png">
					</a>
				</div>
            </div>
	  </div>
		</div>


</form>


<!-- 네이버아디디로로그인 초기화 Script -->
	<script type="text/javascript">
	    var naverLogin = new naver.LoginWithNaverId(
	        {
	            clientId: "UKaPY_NG8vfmTWzC8nVD",
	              // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
	            callbackUrl: "http://localhost/naverLogin",
	              // 본인의 callBack url로 수정하세요.
	            isPopup: true, /* 팝업을 통한 연동처리 여부 */
	            loginButton: {color: "green", type: 2, height: 45} /* 로그인 버튼의 타입을 지정 */
	              // 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
	        }
	    );
	    
		naverLogin.init();
	</script>
<!-- // 네이버아이디로로그인 초기화 Script -->

<!-- // 카카오아이디로로그인 초기화 Script -->
	<script>
    var popup;

    function openPopupAndRedirect() {
        var url = "https://kauth.kakao.com/oauth/authorize?client_id=d55de284af1fa6022291cbef42aa1088&redirect_uri=http://localhost/kakao&response_type=code";
        popup = window.open(url, "Kakao Login", "width=480,height=639");
    }
	</script>

<!-- // 카카오아이디로로그인 초기화 Script -->  




<!-- 모달팝업 -->


	<div id="layer1" class="layerPosition layerPop layerType2" style="width: 600px;" >
      <form id="RegisterForm" action="" method="post" >
	      <input type="hidden" name="action" id="action" value="">
	      <input type="hidden" name="ckIdcheckreg" id="ckIdcheckreg" value="0"/>
	      <input type="hidden" name="ckEmailcheckreg" id="ckEmailcheckreg" value="0"/>	
	      <input type="hidden" name="ckEmailcheckreg" id="ckEmailcheckreg" value="0"/>	

	      
		<dl>
			<dt style="text-align: center; height: 40px;" >
				<p style="margin-top: 20px;"><strong style="font-size:180%;">기업회원 회원가입</strong></p>
			</dt>
			<dd class="content">
				<!-- <div class="btn_areaC">
					<a href="javascript:instaffRegister();" class="btnType blue" id="register_instaff"><span>일반회원</span></a>
					<a href="javascript:outstaffRegister();" class="btnType " id="register_outstaff"><span>기업회원</span></a>
				</div> -->
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<p style="font-size:110%;">
						<span class="font_red">
							&nbsp;&nbsp;
							*
						</span>
						개인회원은 네이버, 카카오, 구글 회원가입을 이용해주세요.<br><br>
					</p>
					<thead>
						<strong style="font-size:110%;">
							<span class="font_red">
								&nbsp;&nbsp;
								*
							</span>
							표시 항목은 필수 입력 항목입니다.
						</strong>
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
									id="registerId" /></td>
								<td><input type="button" value="중복 확인"
									onclick="loginIdCheck()" style="width: 80px; height: 25px;" /></td>
							</tr>
							<tr>
								<th scope="row"><span class="font_red">*</span>비밀번호</th>
								<td colspan="3"><input type="password"
									placeholder="영문, 숫자 조합으로 6~15자리 " class="inputTxt p100"
									name="password" id="registerPwd" /></td>
							</tr>

							<tr>
								<th scope="row" style="padding: 0 0">
									<span class="font_red">*</span>비밀번호 확인</th>
								<td colspan="3"><input type="password"
									placeholder="비밀번호를 한번 더 입력하세요."
									class="inputTxt p100" name="password1" id="registerPwdOk" /></td>
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
							
							
<!-- 							<tr id="user_type_li">
								<th scope="row"><span class="font_red">*</span></th>
								<td colspan="3"><select name="user_type" id="user_type"
									style="width: 400px; height: 28px;">
								</select></td>
							</tr> -->
							
							
							
							
			
				</table>
					
					
					<table class="row" id="ifile">
						<tr>
							<th style="width:130px"; scope="row">첨부파일</br>(증빙서류)</br></br>
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
				
							
					
				<div class="btn_areaC"  style="margin-top: 15px; height: 50px;">
					<a href="javascript:CompleteRegister();" class="btnType blue"
						id="btnCloseLsmCod" name="btn" click="gfCloseModal"> <span>회원가입 완료</span>
					</a> 
					<a href="javascript:fcancleModal()" class="btnType gray" id="btnCloseLsmCod" name="btn" >
						<span>
							취소
						</span>
					</a> <br><br><br>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</form>	
	</div>


<!-- 아이디 비밀번호 찾기 모달 -->
<form id="sendForm" action="" method="post">
	<input type="hidden" name="authNumId" id="authNumId" value="" /> 
	<input type="hidden" name="authNumPwd" id="authNumPwd" value="" />
	<input type="hidden" name="ckIdcheck" id="ckIdcheck" value=""/>
	<div id="layer2" class="layerPop layerType2" style="width: 750px;">
		<dl>
			<dt>
				<strong>아이디/비밀번호 찾기</strong>
			</dt>
			<dd>
				<div class="btn_areaC mt30">
					<a href="javascript:fSelectId();" class="btnType gray" id="findId"><span>아이디
							찾기</span></a> <a href="javascript:fSelectPwd();" class="btnType gray"
						id="findPwd"><span>비밀번호 찾기</span></a>
				</div>
			</dd>
			<dd class="content">

				<!-- 아이디/비밀번호 찾기 폼 -->
				<table class="row" id="findForm">
					<tbody>
						<tr>
							<td id="registerEmailId"><input type="text" id="emailText"
								data-code="I" placeholder="가입하신 이메일을 입력하세요" size="30"
								style="height: 30px;" /> <a href="javascript:SendEmail();"
								class="btnType blue" id="findIdSubmit"><span>이메일 전송</span></a></td>

							<td id="confirm"><input type="text" id="emailNum" name="authnum"
								placeholder="전송된 인증번호를 입력하세요" size="30" style="height: 30px;" />
								<a href="javascript:SendComplete();" class="btnType blue"
								id="sendMail"><span>인증하기</span></a></td>
						</tr>
					</tbody>
				</table>

				<table class="row" id="findPwdForm">
					<tbody>
						<tr>
							<td id="loginRegister"><input type="text" id="emailIdText"
								placeholder="가입하신 아이디를 입력하세요" size="30" style="height: 30px;" />
								<a href="javascript:RegisterIdCheck();" class="btnType blue" id=""><span>아이디 체크</span></a></td>

							<td id="loginEmail"><input type="text" id="emailPwdText"
								data-code="P" placeholder="가입하신 이메일을 입력하세요" size="30"
								style="height: 30px;" /> <a href="javascript:SendPwdEmail();"
								class="btnType blue" id=""><span>이메일 전송</span></a></td>

							<td id="loginPwd"><input type="text" id="emailPwdNum"
								data-code="P" placeholder="전송된 비밀번호를 입력하세요" size="30"
								style="height: 30px;" /> <a
								href="javascript:SendCompletePwd();" class="btnType blue"
								id="emailOk"><span>인증하기</span></a></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
	
</form>

</body>
</html>