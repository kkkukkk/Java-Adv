<%@page import="jdbc.*"%>
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
<title>게시글 보기</title>
<link href="../font.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="bodydiv">
<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">


	<%@ include file="/_header.jsp"%>

	<%!String title = "📖 게시글 보기 📚";%>

	<div class="alert alert-secondary text-center" role="alert">
		<div class="container">
			<h3 class="display-20">
				<%=title%>
			</h3>
		</div>
	</div>


	<%
		String bid = request.getParameter("bid");
	
		BoardDTO board = (new BoardDAO()).getDetail(bid);
		String addr = board.getBaddr();
		String user = board.getBuser();
	%>
		
	<div class="shadow mx-auto mt-5 p-5 w-75 rounded">
	<div class = "row">
	<div class = "col-ma-6">
		<h3><%=board.getBtitle() %></h3>
		<h5><%=board.getBuser() %></h5>
		<p><%=board.getBcontent() %>
		<p><%=board.getBdate()%>
		<p><%=addr%>
	<div class = "col-ma-5">
		<img src="/images/<%=board.getBimage()%>" style="width:100%">
	</div>
	
	<div id="map" style="width:100%;height:350px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=703a92aa4dcf728f3581378ae320a65a&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var addr = "<%=addr%>"; 
		var user = "<%=user%>";

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=user%></div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } else{
		    	alert('찾는 곳이 지도에 존재하지 않습니다. 😥');
		    }
		});    
		</script>
	
	

		<br><br>
		<a href="" class="btn btn-info">좋아요👍</a>
		<a href="boardlist.jsp" class="btn btn-secondary">글 목록</a>
	</div>
	
	
	
	</div>
	</div>









<%@ include file="/_footer.jsp"%>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</div>
</body>
</html>