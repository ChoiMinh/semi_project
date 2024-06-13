<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/mainpage/mainHome.css">

<link rel="stylesheet"	 href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.board{
	width:88%;
	right:7%;
	overflow-y:scroll
}
.board{
   -ms-overflow-style: none;
}
.board::-webkit-scrollbar{
  display:none;
}
</style>
</head>
<body>
<div class="main">
<div class="line">
<div class="home">
	<div class="top">
		<div class="topic"> 관리자 페이지 </div>
			<div id="midmain">
			
			<div class="board">
			 	<div class="member_list">
	<div class="container">
		<h1>계정 목록</h1><a href="input.do">계정등록</a><a href="/logout.do" > 로그아웃</a>
		<table  class="table table-bordered">
			<tr>
				<th>SEQ</th>
				<th>ID</th>
				<th>PASSWORD</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>ACCESS</th>
			</tr>
		<c:forEach var="member" items="${memberList }">
			<tr>
				<td>${member.seq }</td>
				<td><a href="detail.do?seq=${member.seq }">${member.id }</a></td>
				<td>${member.password }</td>
				<td>${member.name }</td>
				<td>${member.email }
				<td>${member.access }</td>
			</tr>
		</c:forEach>
		</table>
		
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