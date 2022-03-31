<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연결</title>
</head>
<body>
<%
// 데이터베이스 연결 테스트

// 드라이버 로드
	try{
	Class.forName("com.mysql.jdbc.Driver");
	out.print("JDBC Driver loading 성공!! by 17박진욱<br>");
	} catch(ClassNotFoundException err){
		out.print("JDBC Driver loading 실패ㅠㅠ<br>");
	}
// DB 연결
	
	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;
	
	try{
		conn = DriverManager.getConnection(url,id,pw);
		out.print("SQL DB 연결 성공!! by 17박진욱<br>");
	}catch(SQLException sqlerr){
		out.print("SQL DB 연결 실패ㅜㅜ<br>");
	} finally{
		// 데이터베이스 연결 종료
		if(conn != null){
			try{
				conn.close();
				out.print("DB 서버 연결 종료...");
			}catch(Exception conerr){
				conerr.printStackTrace();
			}
		}
	}
	
	
%>


</body>
</html>