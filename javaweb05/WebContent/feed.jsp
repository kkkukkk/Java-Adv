<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>
<body style="background-color:#FDEDCC">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%@ include file="menu.jsp" %>

<div class = "container bg-warning shadow mx-auto mt-5 p-5 w-75">

   <form action="feedadd.jsp" method="POST">


      <div class="mb-3">
         <label for="exampleFormControlInput1" class="form-label"><b>작성자</b></label>
         <input type="text" class="form-control" name="name" style="background-color:#FDF8F0"
            id="exampleFormControlInput1" placeholder="작성자 성명">
      </div>
      <div class="mb-3">
         <label for="exampleFormControlTextarea1" class="form-label"><b>방명록
            내용</b></label>
         <textarea name="content" class="form-control" style="background-color:#FDF8F0"
            id="exampleFormControlTextarea1" rows="3" placeholder="내용"></textarea>
      </div>
      <div class="mb-3">
         <input type="submit" style="background-color:#C8B183" value="방명록 등록">
      </div>


   </form>
   </div>
   
   <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
</body>
</html>