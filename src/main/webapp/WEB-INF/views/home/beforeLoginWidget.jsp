<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.login_section{
	padding-left:16px;
	padding-top:16px;
	margin-bottom:16px;
}

.login_button_block{
	margin:0px;
}
.login_button{
	width:298px;
	height:87px;
	color:white;
	font-size:50px;
	font-weight:bold;
	background-color:orange;
	border-radius:5px;
	border-color:white
}
.login_button:hover{
	background-color:#F75D32;
	transition:0.5s;
}
.login_find_reg_section a{
	text-decoration:none;
}
.login_find_reg_section a:hover{
	text-decoration:underline;
}

.login_find_reg_section{
	margin-top:16px;
}
</style>
<div class="login_section">
	<!-- rightside menu 1 -->
	<a class="login_button_block" href="#">
		<button class="login_button">mini 로그인 </button>
	</a>
	<div class="login_find_reg_section">
		<a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> |
		<a href="#">회원가입</a>
	</div>
</div>