<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! 
	String greet = "Hello JSP"; 
	String getString(String s){
		return s;
	}
%>

<%
	out.print(getString(greet));
%>




</body>
</html>