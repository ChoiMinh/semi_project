<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="mainpage/design/mainHome.jsp" %>
</head>
<body>
	<div id="home">
		<div class="top">
			<!-- 상단 메뉴 -->
				<jsp:include page="mainpage/home/top.jsp"></jsp:include>
			<!-- 중간 메뉴 -->
			<div id="midmain">
				<jsp:include page="mainpage/home/board.jsp"></jsp:include>
				<jsp:include page="mainpage/home/login.jsp"></jsp:include>
				<jsp:include page="mainpage/home/time.jsp"></jsp:include>
				<jsp:include page="mainpage/home/ads.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>