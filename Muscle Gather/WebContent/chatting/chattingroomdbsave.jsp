<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String user_email = request.getParameter("user_email");

// 여기서 db 중복 체크////////////////////////////////////////////////////

UserDTO user = (new UserDAO()).getUser(user_email, 0);
String user_no = user.getUser_no();

boolean chk = new ChattingDAO().makeChattingRoom(user_no);

if (chk){
	out.print("<script>window.open('chattingroom.jsp?chatId=" + user_email + "' ,'채팅방', 'width=500, height=450')</script>");
}else{
	out.print("<script>alert('실패했습니다.')</script>");
}

out.print("<script>document.location.href='chatting.jsp'</script>");

%>