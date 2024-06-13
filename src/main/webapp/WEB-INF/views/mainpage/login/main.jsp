<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
function onIdInput(userInput){
	let resetBtn=document.getElementById("reset_id");
	if(userInput.value!=""){
		resetBtn.style.display="block";
	}else{
		resetBtn.style.display="none";
	}
}
function onPwInput(userInput){
	let resetBtn=document.getElementById("reset_pw");
	if(userInput.value!=""){
		resetBtn.style.display="block";
	}else{
		resetBtn.style.display="none";
	}
}
function onResetIdBtnClicked(Btn){
	let id=document.getElementById("user_id");
	id.value="";
	Btn.style.display="none";
}
function onResetPwBtnClicked(Btn){
	let pw=document.getElementById("pw");
	pw.value="";
	Btn.style.display="none";
}
function id_form_mouseover(){
	let id=document.querySelector(".login_id_form");
	id.style.outline="2px solid orange";
}
function id_form_mouseout(){
	let id=document.querySelector(".login_id_form");
	id.style.outline="none";
}
function pw_form_mouseover(){
	let id=document.querySelector(".login_password_form");
	id.style.outline="2px solid orange";
}
function pw_form_mouseout(){
	let id=document.querySelector(".login_password_form");
	id.style.outline="none";
}
//사용자 입력 검증
function inputValidation(){
	let id=document.getElementById("user_id");
	let pw=document.getElementById("pw");
	let msg=document.querySelector(".errMsg");
	
	if(id.value=="" || id.value==null){
		msg.innerHTML="<span><b>아이디</b>를 입력해주세요.<span>";
		id.focus();
		return false;
	}
	if(id.value.length>12 || id.value.length<2){
		msg.innerHTML="<span><b>아이디</b>는 최소 2글자 최대 12글자를 입력하셔야 합니다.<span>";
		id.focus();
		return false;
	}
	if(pw.value=="" || pw.value==null){
		msg.innerHTML="<span><b>비밀번호</b>를 입력해주세요.<span>";
		pw.focus();
		return false;
	}
	if(pw.value.length>16 || pw.value.length<4){
		msg.innerHTML="<span><b>비밀번호</b>는 최소 4글자 최대 16글자를 입력하셔야 합니다.<span>";
		pw.focus();
		return false;
	}
}
</script>
<style>
div{
	
}
.login_container{
    margin:150px auto;
	width:600px;
	height:800px;
	
}
.login_header{
	font-weight:bold;
	text-shadow: 2px 1px 0 #afb59d;
	font-size:50px;
    color: #257226;
	margin:20px;
	height:120px;
	text-align:center;
}
.login_header > a:visited{
	 color: #257226;
}
.login_content{
	border-radius:20px;
	margin:20px;
	padding:20px;
	height:500px;
}
.login_form{
	border:1px solid #81c147;
	border-radius:5px;
}
.login_footer{
	margin:20px;
	height:85px;
}
input{
	flex:left;
	margin:5px 7px;
	width:300px;
	height:20px;
	border:none;
	outline:none;
}
.login_form > div{
	display:flex;
	margin: 20px;
	height:40px;
	border-radius:5px;
	border:1px solid #C0C0C0;
}
.icon{
	margin:5px 7px;
	width:25px;
	height:25px;
}

.login_button{
	width:520px;
	height:50px;
	margin-top:10px;
	color:white;
	font-size:22px;
	font-weight:bold;
	background-color:#bcd19b;
	border-radius:5px;
	border-color:white
}
.login_button:hover{
	background-color:green;
	transition:0.4s;
}
.errMsg{
	padding-left:5px;
	padding-top:5px;
	height:40px;
	color:red;
}
.resetBtn{
	width:25px;
	height:25px;
	margin-top:5px;
	border-radius:50%;
	background-color:#E2E2E2;
	border:none;
	display:none;
}

.login_find_reg_section{
	margin-top: 21px;
	height:40px;
	padding:5px 50px;
}
.login_find_reg_section > a{
	color:#808080;
	margin:20px;
}
.login_find_reg_section > a:hover{
	text-decoration:underline;
}
a{
	text-decoration:none;
}


</style>
<head>
	<meta charset="utf-8">
</head>
<body>
<div class="login_container">
	<div class="login_header">
		<a href="/">Mini</a>
	</div>
	<div class="login_content">
	<form action="login.do" method="POST" onsubmit="return inputValidation()">
<div class=login_form>
	<div class="login_id_form">
			<!-- login icon추가 -->
			<div class="icon">
				<img src="images/login/user-icon.png" width="25px" height="25px"/>
			 </div>
			<input type="text" id="user_id" name="user_id" placeholder="아이디" 
				onmouseover="id_form_mouseover() " onmouseout="id_form_mouseout() "
				onkeyup="onIdInput(this)">
			<button type="button" id="reset_id" class="resetBtn" onclick="onResetIdBtnClicked(this)">X</button>
		</div>
		<div class="login_password_form">
			<!-- login icon추가 -->
			<div class="icon">
				<img src="images/login/lock-icon.png" width="25px" height="25px"/>
			</div>
			<input type="password" id="pw" name="password" placeholder="비밀번호" 
				onmouseover="pw_form_mouseover() " onmouseout="pw_form_mouseout() "
				onkeyup="onPwInput(this)">
			<button type="button" id="reset_pw" class="resetBtn" onclick="onResetPwBtnClicked(this)">X</button>
			</div>
		</div>
		<div class="errMsg">
			${errMsg }
		</div>
		<button class="login_button">로그인</button>
	</form>
	<div class="login_find_reg_section">
		<a href="">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> | <a href="register.do">회원가입</a>
	</div>
	<div class="kakao_login_section">
	<!--  카카오톡 로그인 기능 -->
	</div>
	</div>
	<div class="login_footer">
	
	</div>
</div>
</body>
</html>