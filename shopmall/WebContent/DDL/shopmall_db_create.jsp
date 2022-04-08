<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 생성!</title>
</head>
<body>

	<%
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "0000";

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	conn = DriverManager.getConnection(url, id, pw);
	String sql = "CREATE DATABASE shopmall";
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	if(conn != null) conn.close();
	if(pstmt != null) pstmt.close();
	%>
	
	


</body>
</html>