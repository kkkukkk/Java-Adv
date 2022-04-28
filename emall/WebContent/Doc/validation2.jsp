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
// 길이 검사

	if(document.loginForm.id.value.length() < 3 || document.loginForm.id.value.length() > 20){
		alert("아이디 길이를 맞추세요 쫌");
	}
	if(document.loginForm.pw.value.length() < 2){
		alert("비번이 짧다");
	}
	form.submit();
}
</script>


<form name = "loginForm">
아이디 : <input type="text" name="id">
비   번 : <input type="password" name="pw">
<input type="submit" onclick="CheckForm()">
</form>





</body>
</html>