<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="date" class="java.util.Date" />

<%

	out.print("오늘의 날짜와 시각"); // 문자열 출력
%>

<%=date%>



</body>
</html>