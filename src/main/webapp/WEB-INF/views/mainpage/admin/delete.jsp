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

		<h1>계정 삭제</h1>
		<p>이 계정을 삭제하시겠습니까?</p>
	<form action="delete.do" method="POST">
			<input type="hidden" value="${member.seq }" name="seq"/>
			<table  class="table table-bordered">
				<tr>
					<th>ID</th>
					<td>${member.id }</td>
				</tr>
				<tr>
					<th>PASSWORD</th>
					<td>${member.password }</td>
				</tr>
				<tr>
					<th>NAME</th>
					<td>${member.name }</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>${member.email }</td>
				</tr>
				<tr>
					<th>ACCESS</th>
					<td>${member.access }</td>
				</tr>
				<tr>
					<th> </th>
					<td><input type="submit" value="삭제" /></td>
				</tr>
			</table>
		</form>
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