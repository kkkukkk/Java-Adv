<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<form method="post" name="search" action="trainerListSearchAddr.jsp">
		<div class="input-group mb-3 w-25" style="float:left">
			<input type="text" class="form-control" placeholder="거주중인 도/시 입력" name=searchaddrinfo aria-label="Recipient's username" aria-describedby="button-addon2">
		  	<button type="submit" class="btn btn-secondary">🔍</button>
		</div>
	</form>
	
	<form method="post" name="searchinfo" action="trainerListSearch.jsp">	  	
		<div class="input-group mb-3 w-25" style="float:right">
  			<input type="text" class="form-control" placeholder="검색 내용 입력" name=searchinfo aria-label="Recipient's username" aria-describedby="button-addon2">
  			<button type="submit" class="btn btn-secondary">검색</button>
		</div>
	</form>
</div>

