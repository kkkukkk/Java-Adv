<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
td{
	color:#fff;
	font-weight:bold;
}

label{
	color:#fff;
	font-weight:bold;
}

</style>
<meta charset="UTF-8">
<title>단톡방</title>
</head>
<body style='background-color:grey'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<div class = "container bg-secondary shadow mx-auto mt-5 p-5 w-75 rounded">

<form action = "feedAdd.jsp" method = "post" enctype="multipart/form-data">

<div class="mb-3">
	<label><h3>게시판</h3></label>
</div>

<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">아이디</label>
  <input type="text" name="uid" class="form-control" id="exampleFormControlInput1" placeholder="작성자 아이디">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">글 작성</label>
  <textarea class="form-control" name="ucon" id="exampleFormControlTextarea1" rows="5"></textarea>
</div>
<div class="mb-3">
  <label for="formFile" class="form-label">이미지</label>
  <input class="form-control" type="file" name="uimage" id="formFile">
</div>
<div class="col-12 d-grid gap-2 text-center">
	<button type="submit" class="btn btn-primary btn-dark btn-lg">작성</button>
</div>
</form>




<table align=center>
<br>
<br>
<br>

<tr><td colspan=2>톡보기</td></tr>
<% 
ArrayList<FeedDTO> feeds = (new FeedDAO()).getList();
for (FeedDTO feed : feeds) {
	String img = feed.getImages(), imgstr="";
	if (img != null){
		imgstr = "<img src='images/" + img + "' width = 240>";
	}
%>
<tr><td colspan=2><hr></td></tr>
<tr><td><%=feed.getId() %></td><td><%=feed.getTs() %></td></tr>
<tr><td colspan=2><%=feed.getImages() %></td></tr>
<tr><td colspan=2><%=feed.getContent() %></td></tr>
<%     
}
%>

</table>

</div>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>