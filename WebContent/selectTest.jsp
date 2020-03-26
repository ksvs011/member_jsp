<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
//request.setCharacterEncoding("UTF-8");

Connection conn = null;
PreparedStatement pstmt = null;

String jdbc_driver = "oracle.jdbc.OracleDriver";
String db_url = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	Class.forName(jdbc_driver);
	conn = DriverManager.getConnection(db_url, "scott", "tiger");
	
	String sql = "select * from member";
	pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>member 테이블의 레코드 표시</h2>
	<table border = "1">
	<tr>
	<td width="100">아이디</td>
	<td width="100">패스워드</td>
	<td width="100">이름</td>
	<td width="250">가입일자</td>
	</tr>
<% 	
	while(rs.next()){
		String id = rs.getString("id");
		String passwd = rs.getString("passwd");
		String name = rs.getString("name");
		Timestamp register = rs.getTimestamp("reg_date");
%>
		<tr>
		<td width = "100"> <%=id%> </td>
		<td width = "100"> <%=passwd%> </td>
		<td width = "100"> <%=name%> </td>
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