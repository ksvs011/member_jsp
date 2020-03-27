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

String id= request.getParameter("id");
String password= request.getParameter("password");
String name= request.getParameter("name");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	DAOBase dao = new DAOBase();
	conn = dao.getConnection();
	
	String sql = "select id,password from member where id= ?";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		String rId=rs.getString("id");
		String rPassword=rs.getString("password");
		if(id.equals(rId)&& password.equals(rPassword)){
			sql="update member set name=? where id=?";
			
			if(rs != null)
				try{rs.close();} catch (SQLException e) {}
			if(pstmt !=null) 
				try{pstmt.close();} catch (SQLException e) {}
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
member 테이블의 레코드를 수정했습니다.
</body>
</html>

<%	
	}else{
		out.println("패스워드가 틀렸습니다.");
		}
	}else{
		out.println("아이디가 틀렸습니다.");
		}
	
	}catch (Exception e) {
	e.printStackTrace();
} finally {
	if(rs != null)
		try{rs.close();} catch (SQLException e) {}
	if(pstmt !=null) 
		try{pstmt.close();} catch (SQLException e) {}
	if(conn !=null)
		try{conn.close();} catch (SQLException e) {}
	
}
%>