<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int user_no = Integer.parseInt(request.getParameter("user_no"));

// 여기서 db 중복 체크////////////////////////////////////////////////////

boolean chk = new ChattingDAO().makeChattingRoom(user_no);

/* document.location.href='trainerDetail.jsp?chk="+chk+"' */
if (chk){
	out.print("<script>window.open('chattingroom.jsp' ,'채팅방', 'width=400, height=350')</script>");
}else{
	out.print("<script>alert('실패했습니다.')</script>");
}

%>