<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>오늘의집</title>
</head>
<body>
    <h2>회원가입</h2>
    <p>약관 내용</p>
    <form action="step2" method="post">
    <label>
        <input type="checkbox" name="agree" value="true"> 
        	동의
    </label>
    <input type="submit" value="다음" />
    </form>
</body>
</html>
