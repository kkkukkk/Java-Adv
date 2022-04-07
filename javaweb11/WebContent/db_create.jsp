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
<%@ include file="database_connect.inc" %>
<%
	String sql = "CREATE DATABASE university";  
	pstmt = conn.prepareStatement(sql);	
	pstmt.executeUpdate();
	
%>
<%@ include file="database_disconnect.inc" %>

</body>
</html>