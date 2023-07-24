<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NaverLoginSDK</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- (1) LoginWithNaverId Javscript SDK -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
    
<body>
<script>
    <!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "UKaPY_NG8vfmTWzC8nVD", // 본인걸로 수정, 띄어쓰기 금지.
        callbackUrl: "http://localhost/naverLogincallback.do", // 수정: 네이버 로그인 콜백 URL 설정
        isPopup: true,
        callbackHandle: true
    });

    /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
    naverLogin.init();

    /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
    window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {
            if (status) {

                /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
                var email = naverLogin.user.getEmail();
                var name = naverLogin.user.getName();
                var birthyear = naverLogin.user.getBirthyear();
                var birthday = naverLogin.user.getBirthday();
                var mobile = naverLogin.user.getMobile();

                /* console.log(naverLogin.user.email); // 사용자 이메일 정보를 받을 수 있습니다.
                console.log(naverLogin.user.name); // 사용자 이름 정보를 받을 수 있습니다.
                console.log(naverLogin.user.birthyear); // 사용자 생년 정보를 받을 수 있습니다.
                console.log(naverLogin.user.birthday); // 사용자 생일 정보를 받을 수 있습니다.
                console.log(naverLogin.user.mobile); // 사용자 연락처 정보를 받을 수 있습니다.

                let body = $('body');
                body.append('로그인 성공! ');
                body.append('<h4>이메일 : ' + email + '</h4>');
                body.append('<h4>이름 : ' + name + '</h4>');
                body.append('<h4>생년 : ' + birthyear + '</h4>');
                body.append('<h4>생일 : ' + birthday + '</h4>');
                body.append('<h4>연락처 : ' + mobile + '</h4>'); */

                if (email == undefined || email == null) {
                    alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                    /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
                    naverLogin.reprompt();
                    return;
                }
                if (name == undefined || name == null) {
                    alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
                    /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
                    naverLogin.reprompt();
                    return;
                }
                if (birthyear == undefined || birthyear == null) {
                    alert("생년은 필수정보입니다. 정보제공을 동의해주세요.");
                    /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
                    naverLogin.reprompt();
                    return;
                }
                if (birthday == undefined || birthday == null) {
                    alert("생일은 필수정보입니다. 정보제공을 동의해주세요.");
                    /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
                    naverLogin.reprompt();
                    return;
                }
                if (mobile == undefined || mobile == null) {
                    alert("연락처는 필수정보입니다. 정보제공을 동의해주세요.");
                    /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
                    naverLogin.reprompt();
                    return;
                }

                var callurl = "/naverLogincallback.do";

                $.ajax({
                    url: callurl,
                    type: "POST",
                    dataType: "json",
                    async: true,
                    data: { 'status': status, 'email': email, 'name': name, 'birthyear': birthyear, 'birthday': birthday, 'mobile': mobile },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("AJAX", "true");
                    },
                    success: function (flag) {
                        if (flag.result == 'OK') {
                            close();
                        } else if (flag.result == 'no') {
                            alert('실패 1');
                        }
                    },
                    error: function (request, status, error) {
                        alert("실패 2");
                        //window.close();
                        //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        //window.location.replace("${CTX_PATH}/dashboard/dashboard.do");
                    },
                });

            } else {
                console.log("callback 처리에 실패하였습니다.");
            }
        });
        /* function close() {
            opener.location.reload();
            window.close();
        }  */
        
     // 팝업 창이 닫힐 때 부모 페이지의 URL 변경
        window.addEventListener('beforeunload', function() {
          // 부모 페이지로 이동
          window.opener.location.href = "http://localhost/dashboard/dashboard.do";
        });
    });
</script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js">
    // 네이버로그인
    function fLoginProc(email) {
        var param = {
            lgn_Id: email,
            pwd: "1111"
        };

        var resultCallback = function (data) {
        	location.href = "http://localhost/dashboard/dashboard.do";
        };

        callAjax("/loginProc.do", "post", "json", true, param, resultCallback);
    }
</script> -->
</body>
</html>
