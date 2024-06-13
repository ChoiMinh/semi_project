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
		<h1>계정 수정</h1>
		<form action="edit.do" method="POST">
			<input type="hidden" value="${member.seq }" name="seq">
			<table  class="table table-bordered">
				<tr>
					<th>ID</th>
					<td><input type="text" value="${member.id }" name="id"/></td>
				</tr>
				<tr>
					<th>PASSWORD</th>
					<td><input type="text" value="${member.password }" name="password"/></td>
				</tr>
				<tr>
					<th>NAME</th>
					<td><input type="text" value="${member.name }" name="name"/></td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td><input type="text" value="${member.email }" name="email"/></td>
				</tr>
				<tr>
					<th>ACCESS</th>
					<td>
						<div class="input-group">
							<select name="access" class="custom-select">
								<option value="관리자">관리자</option>
								<option value="사용자">사용자</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th> </th>
					<td><input type="submit" value="수정" /></td>
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