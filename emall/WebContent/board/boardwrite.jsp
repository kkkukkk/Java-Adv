<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<div class="container" style="padding-top:30px;">
     <form name="newProduct" class="form-horizontal"  action="boardwritedb.jsp" method="post" enctype="multipart/form-data" align="center">
       <div class="form-group  row">
          <label class="col-sm-2">제목</label>
              <div class="col-sm-4">
              <input name="title" type="text" class="form-control" placeholder="Enter the Title" >
       </div>
   </div>
      <div class="form-group  row" style="display:none;">
         <label class="col-sm-2">작성자</label>
            <div class="col-sm-4">
              <input name="id" type="text" class="form-control" value="test"placeholder="Enter the name" >
      </div>
   </div>
      <div class="container" style="padding-top: 30px;">
         <textarea id="summernote" name="editordata"></textarea>
      </div>

		<br>
       <div class="form-group  row">
            <label class="col-sm-2">첨부파일</label>
            <div class="col-sm-4">
               <input name="filename" type="file" class="form-control" >
            </div>
       </div>
       
       <br>
   <div class="col-sm-offset-5 col-sm-5">
      <input type="submit" class="btn btn-dark" value="글쓰기 " > 
       <input type="reset" class="btn btn-dark" value="취소" onclick="reset()" >
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