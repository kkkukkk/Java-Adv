<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String user_email = request.getParameter("user_email");
String user_pw = request.getParameter("user_pw");

UserDAO dao = new UserDAO();
UserDTO user = (new UserDAO()).getUser(user_email, 0);
String user_no = user.getUser_no();
int result = dao.login(user_email, user_pw);

if (result == 1) { // 실패 케이스 1 아이디가 아예 없다.
	out.print("<script>alert('이메일을 확인해 주세요')</script>");
	out.print("<script>document.location.href='logintest.jsp'</script>");
} else if (result == 2) { // 비번이 틀린케이스이므로 다시 로그인
	out.print("<script>alert('비밀번호를 확인해주세요')</script>");
	out.print("<script>document.location.href='logintest.jsp?user_email="+user_email+"'</script>");
} else {
	session.setAttribute("user_email", user_email);
	session.setAttribute("user_no", user_no);
	response.sendRedirect("../trainer/trainerListTest.jsp");
}
%>