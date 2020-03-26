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
String passwd= request.getParameter("password");
String name= request.getParameter("name");
Timestamp register = new Timestamp(System.currentTimeMillis());

Connection conn = null;
PreparedStatement pstmt = null;
String str = "";

String jdbc_driver = "oracle.jdbc.OracleDriver";
String db_url = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	Class.forName(jdbc_driver);
	conn = DriverManager.getConnection(db_url, "scott", "tiger");
	
	String sql = "insert into member values (?,?,?,CURRENT_TIMESTAMP)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,id);
	pstmt.setString(2,passwd);
	pstmt.setString(3,name);
	//pstmt.setTimestamp(4,register);  //SYSTIMESTAMP // CURRENT_TIMESTAMP
	int result = pstmt.executeUpdate();
	if(result == 1){
		str= id + "님 사이트의 memeber로 등록되었습니다.";
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