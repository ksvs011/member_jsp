<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	try{
		DAOBase dao = new DAOBase();
		Connection conn = dao.getConnection();
		
		String loginId = request.getParameter("id");
		String loginPassword = request.getParameter("password");
		
		PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM member"
			   +" WHERE id = ? AND password = ?"
				);
		pstmt.setString(1, loginId);
		pstmt.setString(2, loginPassword);
		
		ResultSet rs = pstmt.executeQuery(); 
		if(rs.next()){
			if(loginId.equals("admin")){
				%>
				<button type="button" onclick="location.href='updateTestForm.jsp'">회원정보수정</button>
				<button type="button" onclick="location.href='deleteTestForm.jsp'">회원정보삭제</button>
				<button type="button" onclick="location.href='selectTest.jsp'">회원정보확인</button>
				<%
			}else{
		%>
				<button type="button" onclick="location.href='updateTestForm.jsp'">회원정보수정</button>
		<%
		
			}
		}else{
		%>	
			<p>id 또는 비밀번호 오류</p>
		<% 	
		}

		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

</body>
</html>