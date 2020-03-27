<%@page import="model.DAOBase"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
request.setCharacterEncoding("UTF-8");

String id= request.getParameter("id");
String password= request.getParameter("password");
String name= request.getParameter("name");
String email= request.getParameter("email");
String phonenum= request.getParameter("phonenum");

Timestamp register = new Timestamp(System.currentTimeMillis());

Connection conn = null;
PreparedStatement pstmt = null;
String str = "";

try{
	DAOBase dao = new DAOBase();
	conn = dao.getConnection();
	
	String sql = "INSERT INTO MEMBER VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM MEMBER),?,?,?,?,?,CURRENT_TIMESTAMP)";
	pstmt= conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,password);
	pstmt.setString(3,name);
	pstmt.setString(4,email);
	int pb = Integer.parseInt(phonenum);
	pstmt.setInt(5,pb);
	
	int result = pstmt.executeUpdate();
	if(result == 1){
		%>
		<script>
		alert("회원가입이 완료되었습니다.");
		document.location.href="login.jsp";
		</script>
		<%
	} else {
		str= id + "님 사이트의 memeber 등록에 실패하였습니다. 다시 가입해 주세요.";
	}
	
} catch (Exception e) {
	e.printStackTrace();
	str = "Member 테이블에 새로운 레코드 추가를 실패했습니다.";
} finally {
	if(pstmt !=null) {
		try{pstmt.close();} catch (SQLException e) {}
	}
	if(conn !=null){
		try{conn.close();} catch (SQLException e) {}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= str %>
</body>
</html>