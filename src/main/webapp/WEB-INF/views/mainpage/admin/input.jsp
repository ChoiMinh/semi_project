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

		<h1>계정 생성</h1>
		<form action="input.do" method="POST">
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<td><input type="text" placeholder="아이디를 입력하세요" name="id"/></td>
				</tr>
				<tr>
					<th>PASSWORD</th>
					<td><input type="password" placeholder="비밀번호를 입력하세요" name="password"/></td>
				</tr>
				<tr>
					<th>NAME</th>
					<td><input type="text" placeholder="이름" name="name"/></td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>
						<div class="input-group">
							<input type="text" placeholder="이메일" name="email" class="form-control"/>
							<select name="emailDomain" class="custom-select">
								<option value="@naver.com">@naver.com</option>
								<option value="@gmail.com">@gmail.com</option>
								<option value="@icloud.com">@icloud.com</option>
								<option value="@daum.net">@daum.net</option>
							</select>
						</div>
					</td>
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
					<th></th>
					<td style="text-align: center;"><input type="submit" value="저장" class="btn btn-primary"/></td>
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