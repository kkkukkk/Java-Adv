<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 출력</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
// JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
// DB연결
	String url = "jdbc:mysql://localhost:3306/exercisedb";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;  // 디비 연결 객체
	PreparedStatement pstmt = null; // 디비에 전달할 SQL 구문객체
	ResultSet rs = null; 	// 디비에서 꺼내올 데이터들을 담을 객체
	
	conn = DriverManager.getConnection(url, id, pw);
	
// 테이블 데이터 넣는 SQL

	String sql = "SELECT * FROM student";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery(); 
%>

<form>
<table>
<caption>학생 목록</caption>
<tr>
<th>학번</th>
<th>전공</th>
<th>이름</th>
<th>주소</th>
<th>전화번호</th>
</tr>
<%
	while(rs.next()){
		
		String num = rs.getString("num");
		String depart = rs.getString("depart");
		String name = rs.getString("name");
		String address = rs.getString("address");
		String phone = rs.getString("phone");
	
%>
<tr>
	<td><%=num %></td>
	<td><%=depart %></td>
	<td><%=name %></td>
	<td><%=address %></td>
	<td><%=phone %></td>
</tr>
<%
	}
%>
</table>
</form>




<%
// DB 연결 종료
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
	if (rs != null) rs.close();
%>

</body>
</html>