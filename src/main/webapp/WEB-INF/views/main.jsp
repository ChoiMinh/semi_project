<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 로그인 체크 -->
<c:choose>
	<c:when test='${user==null }'>
		<link rel="stylesheet" href="/css/mainpage/mainHome.css">
	</c:when>
	<c:otherwise>
		<link rel="stylesheet" href="/css/mainpage/loginProfile.css">
	</c:otherwise>
</c:choose>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap">
</head>
<body>
	<div class="main">
		<div class="line">
			<div class="home">
				<div class="top">
					<!-- 상단 메뉴 -->
						<div class="topic"> Commerative Garden</div>
					<!-- 중간 메뉴 -->
					<div id="midmain">
						<div class="board"> 
							<iframe src="https://www.youtube.com/embed/QW6rFHdiUaM?autoplay=1&loop=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						 </div>
						<div id="midmain">
						<div class="flex-container">
							<div class="box">
								<c:choose>
								<c:when test='${user==null }'>
									<jsp:include page="mainpage/home/login.jsp"></jsp:include>
								</c:when>
								<c:otherwise>
									<jsp:include page="mainpage/home/profile.jsp"></jsp:include>
								</c:otherwise>
								</c:choose>
							</div>
							<div class="box">
								<jsp:include page="mainpage/home/time.jsp"></jsp:include>
							</div>
							<div class="box ad">
								<jsp:include page="mainpage/home/ads.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>