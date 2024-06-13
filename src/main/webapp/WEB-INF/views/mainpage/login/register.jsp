<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script>
let idCheck=/^[a-z0-9]{2,12}$/;
let nicknameCheck=/[^\w\sㄱ-힣()0-9]/g

var isIdDupCheck=false;
var isNicknameDupCheck=false;

var isErrorOnId=true;
var isErrorOnNickname=true;

function IdDupCheck(){
	let msg=document.querySelector("#errMsg_1");
	let id=document.querySelector(".user_id");
	if(id.value=="" || isErrorOnId){
		msg.innerHTML="<span><b>아이디</b>가 비어있거나 형식에 맞지 않습니다.</span>";
		return;
	}
	const xhr=new XMLHttpRequest();
	xhr.onload=function(){
		if(JSON.parse(xhr.response)){
			msg.innerHTML="<span><b>아이디</b>가 중복됩니다.</span>";
		}else{
			isIdDupCheck=true;
			msg.innerHTML='<span style="color:green"><b>사용가능한 아이디입니다.</span>';
		}
	}
	xhr.open("GET","http://localhost:8099/idCheck.do?user_id="+id.value,true);
	xhr.send();
}

function nicknameDupCheck(){
	let msg=document.querySelector("#errMsg_2");
	let nickname=document.querySelector(".nickname");
	if(nickname.value=="" || isErrorOnNickname){
		msg.innerHTML="<span><b>닉네임</b>이 비어있거나 형식에 맞지 않습니다.</span>";
		return;
	}
	const xhr=new XMLHttpRequest();
	xhr.onload=function(){
		isDup=JSON.parse(xhr.response);
		if(isDup){
			msg.innerHTML="<span><b>닉네임</b>이 중복됩니다.</span>";
		}else{
			isNicknameDupCheck=true;
			msg.innerHTML='<span style="color:green"><b>사용가능한 닉네임입니다.</span>';
		}
	}
	xhr.open("GET","http://localhost:8099/nicknameCheck.do?nickname="+nickname.value,true);
	xhr.send();
}

function userPhotoChange(){
	let img=document.getElementById('preview');
	let imgInput=document.getElementById('photo');
	let nameIndex=img.src.indexOf(".jpg")-1;
	nameIndex=parseInt(img.src.charAt(nameIndex))+1;
	
	if(nameIndex==10) nameIndex=1;
	let imgURL="images/userProfileImg/"+nameIndex+".jpg";
	img.src=imgURL;
	imgInput.value=imgURL;
}
/*
function userFileUpload(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src ="images/login/temp-profile.jpg";
	  }
}
*/
function onIdKeyup(){
	let id=document.querySelector(".user_id");
	let msg=document.querySelector("#errMsg_1");
	isDupCheck=false;
	if(!idCheck.test(id.value)){
		console.log(!idCheck.test(id.value));
		msg.innerHTML="<span><b>아이디</b>는 2~12자의 영문, 숫자만 사용이 가능합니다.<span>"
		isErrorOnId=true;
	}else{
		msg.innerHTML="";
		isErrorOnId=false;
	}
}
function onNicknameKeyUp(){
	let nickname=document.querySelector(".nickname").value;
	let msg=document.querySelector("#errMsg_2");
	console.log(nicknameCheck.test(nickname)+"/nickname : "+nickname);
	if((nickname.length<3 || nickname.length>12) || nicknameCheck.test(nickname)){
		msg.innerHTML="<span><b>닉네임은</b>3~12자의 영문, 숫자, 한글만 사용이 가능합니다.<span>"
		isErrorOnNickname=true;
	}else{
		msg.innerHTML="";
		isErrorOnNickname=false;
	}
}
function inputValidation(){
	let id=document.querySelector(".user_id");
	let pw=document.querySelector(".pw");
	let repw=document.querySelector("#repassword");
	let email=document.querySelector(".email");
	let msg=document.getElementById("errMsg_1");
	if(!isIdDupCheck){
		msg.innerHTML="<span><b>아이디</b> 중복체크를 해주세요.</span>";
		id.focus();
		return false;
	}
	
	if(!isNicknameDupCheck){
		let msg2=document.getElementById("errMsg_2");
		let nick=document.querySelector(".nickname");
		msg2.innerHTML="<span><b>닉네임</b> 중복체크를 해주세요.</span>";
		nick.focus();
		return false;
	}
	
	if(id.value=="" || id.value==null){
		msg.innerHTML="<span><b>아이디</b>를 입력해주세요.</span>";
		id.focus();
		return false;
	}
	if(id.value.length>12 || id.value.length<2){
		msg.innerHTML="<span><b>아이디</b>는 최소 2글자 최대 12글자를 입력하셔야 합니다.</span>";
		id.focus();
		return false;
	}
	
	if(pw.value=="" || pw.value==null){
		msg.innerHTML="<span><b>비밀번호</b>를 입력해주세요.<span>";
		pw.focus();
		return false;
	}
	if(pw.value.length>16 || pw.value.length<4){
		msg.innerHTML="<span><b>비밀번호</b>는 최소 4글자 최대 16글자를 입력하셔야 합니다.</span>";
		pw.focus();
		return false;
	}
	if(pw.value!=repw.value){
		msg.innerHTML="<span><b>비밀번호</b>와 <b>확인비밀번호</b> 값이 다릅니다.</span>";
		pw.focus();
		return false;
	}
}
</script>
<style>
*{
	background-color:#E2E2E2;
}
.container{
	margin:0px auto;
	width:600px;
	height:700px;
}

input{
	position:absolute;
	font-size:15px;
	top:10px;
	left:52px;
	display:flex;
	border:none;
	outline:none;
	width:450px;
	height:30px;
}
.user_input > div{
	display:flex;
	flex-direction:column;
	position:relative;
	height:50px;;
}

.reg_id_section{
	border:3px solid black;
	border-bottom:none;
	border-radius:20px 20px 0px 0px;
}
.reg_password_section{
	border:3px solid black;
}
.reg_email_section{
	border:3px solid black;
	border-top:none;
	border-radius:0px 0px 20px 20px;
}
.reg_nickname_section{
	display:flex;
	flex-direction:column;
	position:relative;
	height:50px;;
}

.icon{
	position:absolute;
	top:10px;
	margin:5px 8px;
	width:auto;
	height:auto;
	border:none;
}

.reg_button{
	width:570px;
	height:50px;
	margin-left:10px;
	margin-top:10px;
	color:white;
	font-size:22px;
	font-weight:bold;
	background-color:#bcd19b;
	border-radius:5px;
	border-color:white
}
.reg_button:hover{
	background-color:green;
	transition:0.9s;
}

.errMsg{
	margin:5px 10px;
	padding-left:5px;
	padding-top:5px;
	height:40px;
	color:red;
	border:none;
}
.reg_nickname_section{
	border:3px solid black;
	border-radius:20px 20px 0px 0px;
	border-bottom:none;
}
.reg_photo_section{
	border:3px solid black;
	border-radius:0px 0px 20px 20px;
	height:300px;
	position:relative;
}
.show_photo{
	position:absolute;
	left:5px;
	top:5px;
	width:250px;
	height:210px;
	border-radius:20px;
	overflow:hidden;
}
.description{
	display:inline;
	position:absolute;
	left:267px;
	top:11px;
}
.photo{
	display:inline;
	position:absolute;
	width:138px;
	left:268px;
	top:58px;
	font-size:18px;
	font-weight:bold;
	background-color:#bcd19b;
	border-radius:20px;
}
.photo:hover{
	background-color:green;
	transition:0.9s;
}
fieldset{
	border:none;
}
.id_check{
	position:absolute;
	left:478px;
	top:15px;
	border-radius:5px;
	background-color:#bcd19b;
	color:black;
}
.id_check:hover{
	background-color:green;
	transition:0.9s;
}
.reg_password_section.2{
	border-top:none;
}

</style>
<head>
	<meta charset="UTF-8">
</head>
<body>
<div class="container">
	<div class="header">
		<h1><a href="/" >Mini</a></h1>
	</div>
	<div class="reg_box">
		<form action="register.do" method="POST" onsubmit="return inputValidation()">
			<fieldset class="user_input">
		<div class="reg_id_section">
			<div class=icon>
				<img src="images/login/user-icon.png" width="25px" height="25px"/>
			</div>
			<input type="text" name="user_id" class="user_id" placeholder="아이디"
					onkeydown="onIdKeyup()">
			<div>
				<button type="button" class="id_check" onclick="IdDupCheck()">중복확인</button>
			</div>
		</div>
		<div class="reg_password_section">
			<div class="icon">
				<img src="images/login/lock-icon.png" width="25px" height="25px"/>
			</div>
			<input type="password" name="password" class="pw" placeholder="비밀번호" required>
		</div>
		<div class="reg_password_section 2">
			<div class="icon">
				<img src="images/login/lock-icon.png" width="25px" height="25px"/>
			</div>
			<input id="repassword" type="password" class="pw" placeholder="비밀번호 확인" required>
		</div>
		<div class="reg_email_section">
			<div class="icon">
				<img src="images/login/mail-icon.png" width="25px" height="25px"/>
			</div>
			<input type="email" name="email" class="email" placeholder="이메일주소" required>
		</div>
		</fieldset>
			<div id="errMsg_1" class="errMsg"></div>
		<fieldset class="user_profile_input">
		<div class="reg_nickname_section">
			<div class="icon">
				<img src="images/login/card-icon.png" width="25px" height="25px"/>
			</div>
			<input type="text" class="nickname" name="nickname" placeholder="닉네임" onkeydown="onNicknameKeyUp()">
			<button type="button" class="id_check" onclick="nicknameDupCheck()">중복확인</button>
		</div>
		<div class="reg_photo_section">
			<div class="show_photo">
				<img id="preview" src="images/userProfileImg/4.jpg" width="250" height="210"/>
				<input type="hidden" id="photo" name="photo" value="images/userProfileImg/4.jpg"/>
			</div>
			<div class="description">
				<b>프로필 사진</b>을 선택해주세요
			</div>
			<button type="button" class="photo" onclick="userPhotoChange()">프로필 선택 </button>
			<!-- 
			<input type="file" name="file" class="photo" onchange="userFileUpload(this)">
			 -->
		</div>
		</fieldset>	
		<div id="errMsg_2" class="errMsg"></div>
		<button class="reg_button">회원 가입</button>
	</form>
	</div>
</div>
</body>
<!-- 
<a href="https://www.flaticon.com/kr/free-icons/" title="사용자 아이콘">사용자 아이콘 제작자: Freepik - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="자물쇠 아이콘">자물쇠 아이콘 제작자: Freepik - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="이메일 아이콘">이메일 아이콘 제작자: Freepik - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="...에서 아이콘">...에서 아이콘 제작자: Freepik - Flaticon</a>
 -->
</html>