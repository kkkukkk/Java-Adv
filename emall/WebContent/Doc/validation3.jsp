<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type = "text/javascript">
function CheckForm(){
/* 	if(!isNaN(document.loginForm.id.value.substr(0,1))){ */
	var ch = loginForm.id.value.charAt(0);	
	if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch >'0' || ch <'9')){	
		alert("대문자 써");
		document.loginForm.id.select();
	}
	form.submit();
}
</script>


<form action="abab.jsp" name = "loginForm">
아이디 : <input type="text" name="id">
비   번 : <input type="password" name="pw">
<input type="submit" onclick="CheckForm()">
</form>




</body>
</html>