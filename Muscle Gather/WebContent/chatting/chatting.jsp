<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_email = (String) session.getAttribute("user_email");
	if(user_email == null){
		response.sendRedirect("/Muscle_Gather/user/login.jsp");
		return;
	}//세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용
	session.setAttribute("user_email", user_email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<button onclick="location.href='chattingroomdbsave.jsp?user_email=<%=user_email%>'" style="cursor:pointer;">채팅 입장</button>



</body>
</html>