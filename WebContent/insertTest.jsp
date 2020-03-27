<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h2> 회원가입 </h2>
<form action="insertTestpro.jsp" method="post">
	아이디:<input type = "text" name = "id" id="id" maxlength="50"><br>
	패스워드:<input type = "password" name = "password" id="password" maxlength="16"><br>
	이름:<input type = "text" name = "name" id="name" maxlength="10"><br>
	이메일:<input type = "text" name = "email" id="email" maxlength="50"><br>
	핸드폰 번호:<input type = "text" name = "phonenum" id="phonenum" maxlength="12" value="숫자만 입력해주세요."><br>
	<input type="submit" value="입력완료">
</form>

</html>