<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 삭제</title>
</head>
<body>
<%
		// 드라이버 로딩
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.print("JDBC Driver loading 성공!! by 17박진욱<br>");
	} catch (ClassNotFoundException err) {
		out.print("JDBC Driver loading 실패ㅠㅠ<br>");
	}

	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "0000";

	Connection conn = null; 			// 연결 객체
	PreparedStatement pstmt = null;		// 구문 객체
	
	try {
		conn = DriverManager.getConnection(url, id, pw);
		out.print("SQL DB 연결 성공!! by 17박진욱<br>");
		
		String sql = "DROP DATABASE univ2";  // DB생성 sql 구문
		
		pstmt = conn.prepareStatement(sql);		// 구문을 객체에 넣어서
		
		pstmt.executeUpdate();					// 구문 객체 실행
		
		out.print("univ 데이터베이스 삭제 성공!!<br>");
		
	} catch (SQLException sqlerr) {
		out.print("univ 데이터베이스 삭제 실패ㅜㅜ<br>");
	} finally {
		// 데이터베이스 연결 종료
		if (conn != null) {
			try {
		conn.close();
		out.print("DB 서버 연결 종료...<br>");
			} catch (Exception conerr) {
		conerr.printStackTrace();
			}
		}
	}
	
	%>

</body>
</html>