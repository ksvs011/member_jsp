<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="loginChecked.jsp"method="post">
아이디:<input type = "text" name="id" id="id"><br>
패스워드:<input type = "password" name="password" id="password"><br>
<input type="submit" value="로그인">
<button type="button" onclick="location.href='insertTest.jsp'">회원가입</button>
</form>
</body>
</html>