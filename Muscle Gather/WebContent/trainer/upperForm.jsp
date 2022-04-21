<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<form method="post" name="search" action="trainerListSearch.jsp">
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button" id="selected" data-bs-toggle="dropdown" aria-expanded="false">
			지역
			</button>
			<ul class="dropdown-menu">
			  <li><a class="dropdown-item" href="#">안녕</a></li>
			  <li><a class="dropdown-item" href="#">하세</a></li>
			  <li><a class="dropdown-item" href="#">요</a></li>
			</ul>
			
			<button class="btn btn-secondary dropdown-toggle" type="button" id="selected" data-bs-toggle="dropdown" aria-expanded="false">
			상세 지역
			</button>
			<ul class="dropdown-menu">
			  <li><a class="dropdown-item" href="#">안녕</a></li>
			  <li><a class="dropdown-item" href="#">하세</a></li>
			  <li><a class="dropdown-item" href="#">요</a></li>
			</ul>
			
		  	<button type="submit" class="btn btn-secondary">검색</button>
		</div>
	</form>
	
	<form method="post" name="search" action="trainerListSearch.jsp">	  	
		<div class="input-group mb-3 w-25" style="float:right">
  			<input type="text" class="form-control" placeholder="검색 내용 입력" name=searchinfo aria-label="Recipient's username" aria-describedby="button-addon2">
  			<button type="submit" class="btn btn-secondary">검색</button>
		</div>
	</form>
</div>