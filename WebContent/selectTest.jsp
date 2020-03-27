<%@page import="model.DAOBase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
request.setCharacterEncoding("UTF-8");

Connection conn = null;
PreparedStatement pstmt = null;

try{
	DAOBase dao = new DAOBase();
	conn = dao.getConnection();
	
	String sql = "select * from member";
	pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
</head>
<body>
	<h2>회원정보 조회</h2>
	<table border = "1">
	<tr>
	<td width="100">회원번호</td>
	<td width="100">아이디</td>
	<td width="100">이름</td>
	<td width="100">email</td>
	<td width="100">핸드폰번호</td>
	<td width="250">가입일자</td>
	</tr>
<% 	
	while(rs.next()){
		String num = rs.getString("num");
		String id = rs.getString("id");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String phonenum = rs.getString("phonenum");
		Timestamp register = rs.getTimestamp("reg_date");
%>
		<tr>
		<td width = "100"> <%=num%> </td>
		<td width = "100"> <%=id%> </td>
		<td width = "100"> <%=name%> </td>
		<td width = "100"> <%=email%> </td>
		<td width = "100"> <%=phonenum%> </td>
		<td width = "100"> <%=register.toString()%> </td>
		</tr>
<%	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(pstmt !=null) {
		try{pstmt.close();} catch (SQLException e) {}
	}
	if(conn != null){
		try{conn.close();} catch (SQLException e) {}
	}
}

%>
</table>
</body>
</html>