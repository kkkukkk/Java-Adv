<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="person" class="study.Person" scope="request" />
아이디 : <jsp:setProperty name="person" property="id" value="20182005" />
이  름 : <jsp:setProperty name="person" property="name" value="홍길동" />



</body>
</html>