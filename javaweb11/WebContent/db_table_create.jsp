<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 생성!</title>
</head>
<body>
<%@ include file="database_connect.inc" %>

<%
   
// 테이블 만들기 SQL
	String sql = "CREATE TABLE student("
			+"hakbun int not null,"
			+"name   varchar(10),"
			+"gender varchar(10),"
			+"year   tinyint,"
			+"dept   varchar(20),"
			+"addr   varchar(50),"
			+"primary key(hakbun))";
	
	pstmt = conn.prepareStatement(sql);
   	pstmt.executeUpdate();
   	
%>
<%@ include file="database_disconnect.inc" %>

</body>
</html>