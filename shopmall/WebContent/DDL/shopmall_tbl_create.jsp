<%@page import="java.sql.*" %>
<%@page import="dbconnclose.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 생성!</title>
</head>
<body>
<%
Connection conn = null;
PreparedStatement pstmt = null; // 구문 객체

conn = DbConnClose.getConnection();

	String sql = "CREATE TABLE customer("
			+"cust_id		varchar(10) NOT NULL,"
			+"cust_pw 		varchar(10),"
			+"cust_name		varchar(15),"
			+"cust_tel_no	varchar(13),"
			+"cust_addr		varchar(100),"
			+"cust_gender	char(1),"
			+"cust_email 	varchar(30),"
			+"cust_join_date date,"
			+"primary key(cust_id))";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	DbConnClose.resourceClose(pstmt, conn);
%>


</body>
</html>