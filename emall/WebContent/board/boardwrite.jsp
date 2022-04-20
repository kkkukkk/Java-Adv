<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String uid = (String) session.getAttribute("id");
	if(uid ==null){
		response.sendRedirect("/user/login.jsp");
		return;
	}//세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용

%>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
</head>
<link href="../font.css" rel="stylesheet" type="text/css">

<body>

<div class="bodydiv">



	<%@ include file="/_header.jsp"%>

	<%!String title = "게시글 작성✏️";%>

	<div class="alert alert-secondary text-center" role="alert">
		<div class="container">
			<h2 class="display-10">
				<%=title%>
			</h2>
		</div>
	</div>
	
	<div class="container shadow mx-auto mt-5 p-5 w-75 rounded" style="padding-top:30px;">
     <form name="newProduct" class="form-horizontal"  action="boardwritedb.jsp" method="post" enctype="multipart/form-data" align="center">
       <div class="form-group row">
			<label class="col-sm-2"><h3><b>제목</b></h3></label>
			<div class="col-sm-6">
				<input type="text" name="btitle" class="form-control">
			</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"><h3><b>집주소</b></h3></label>
		<div class="col-sm-6">
			<input type="text" name="baddr" class="form-control">
		</div>
	</div>
		
		
		
      <br>     
      <div class="form-group row">
         <textarea id="summernote" name="bcontent"></textarea>
      </div>

	  <br>
      <div class="form-group row justify-content-center">
			<div class="col-sm-8">
  			<label for="formFile" class="form-label">사진 업로드 📷</label>
  			<input class="form-control" name="bimages" type="file" id="formFile">
			</div>
		</div>
       
       <br>
  	 	<div class="form-group row justify-content-center">
			<div class="col-sm-2">
				<input type="submit" class="btn btn-dark form-control" value="등록">
			</div>
			<div class="col-sm-2">
				<input type="reset" class="btn btn-dark form-control" value="취소">
			</div>
		</div>
   
     </form>
   </div>
   
   

	

<%@ include file="/_footer.jsp"%>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script type="text/javascript"
		src="//code.jquery.com/jquery-3.6.0.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	<script>
		$('#summernote').summernote({
			placeholder : 'Hello Bootstrap 5',
			tabsize : 2,
			height : 100
		});
	</script>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

   
</div>
</body>
</html>