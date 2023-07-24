<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>KakaoLogin</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
     <script>
    window.onload = function() {
            window.close();
    };
    </script>
</head>
<body>
    <p>카카오 로그인 진행 중 새로고침을 하시거나 창을 닫아주세요.</p>
    <script>
    function closePopupAndRedirect() {
        // 부모 페이지로 이동
        window.opener.location.href = "http://localhost/dashboard/dashboard.do";
    }

    window.addEventListener('beforeunload', function() {
        closePopupAndRedirect();
    });
    </script>
</body>
</html>
