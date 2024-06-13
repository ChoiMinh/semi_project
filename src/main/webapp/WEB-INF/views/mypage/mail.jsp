<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메일함</title>
<script>
let id=${user.id};

getList('message/list.do?id='+id);

function getList(URL){
	const xhr=new XMLHttpRequest();
	xhr.onload=()=>{
		console.log(JSON.parse(xhr.responseText));
		drawMessageBox(JSON.parse(xhr.responseText))
	}
	
	xhr.open("GET","http://localhost:8099/"+URL,true);
	xhr.send();
}

function updateData(URL){
	const xhr=new XMLHttpRequest();
	xhr.onload=()=>{
		history.go(0);
	}
	xhr.open("GET","http://localhost:8099/"+URL,true);
	xhr.send();
}

function drawMessageBox(data){
let container=document.querySelector('.show_container');

container.innerHTML="";
	for(let i=0;i<data.length;i++){
		container.innerHTML+=`
			<div class="component">
				<div class="sender">
					보낸사람 : \${data[i].sender} 
				</div>
				<div class="receiver">
					받은사람 : \${data[i].receiver} 
				</div>
				<div class="date">
					 받은 날짜 : \${data[i].m_date}
				</div>
				<div class="content">
					 \${data[i].m_text}
				</div>
				<button type="button" class="deleteBtn" 
					onclick="deleteMessage(this)" data-m_id=\${data[i].m_id}>
					X
				</button>
			</div>
		`
	}
}
function messageList(){
	console.log("버튼 누름1");
	getList('message/list.do?id='+id);
}
function receiveMessageList(){
	console.log("버튼 누름2");
	getList('message/receiveList.do?id='+id);
}

function sendMessageList(){
	console.log("버튼 누름3");
	getList('message/sendList.do?id='+id);
}
function deleteMessage(btn){
	console.log("버튼 누름4");
	updateData('message/delete.do?m_id='+btn.dataset.m_id);
}
function sendMessagePage(){
	let container=document.querySelector('.show_container');
	container.innerHTML="";
	container.innerHTML+=`
	<form action="message/insert.do" method="GET">
		<input type="hidden" name="id" value=\${id}>
		<div class="component">
			<div class="receiver">
				받을 사람 <input type="text" name="receiver" placeholder="받을 사람" required>
			</div>
			<div class="content send">
				 <textarea rows="10" cols="30" name="content" placeholder="내용"required></textarea>
			</div>
			<button class="addBtn">
				O
			</button>
		</div>
	</button>
	`
}
</script>
<style>
@font-face {
    font-family: 'Ownglyph_ryuttung-Rg';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-2@1.0/Ownglyph_ryuttung-Rg.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.message_container{
	position:relaitive;
	width:601px;
	height:720px;
}
.side_menu{
	position:absolute;
	border:3px solid green;
	border-radius:30px;
	overflow:visible;
	left:25px;
	top:25px;
	width:180px;
	height:250px;
}
.all{
	position:absolute;
	left:-15px;
	top:5px;
}
li{
	padding-top:15px;
}
.send_button{
	position:absolute;
	background-color:#728875;
	color:white;
	left:35px;
	top:195px;
	width:150px;
	height:40px;
}
.send_button:hover{
	background-color:green;
}
button{
	border:none;
	backgroud:#FFFFFF;
	font-size:15px;
	border-radius:5px;
}
li > ul{
	list-style-image:url("/images/mail/letter");
}
.receive_icon > button{
	background-color:#728875;
	color:white;
}
.receive_icon > button:hover{
	background-color:green;
}
.show_container{
	position:absolute;
	left:225px;
	top:25px;
	width:370px;
	height:660px;
	overflow-y:scroll;
}

.component  div{
	font-family: 'Ownglyph_ryuttung-Rg';
	font-weight:bold;
	font-size:20px;
}
.component{
	position:relative;
	margin-left:5px;
	margin-top:5px;
	margin-bottom:50px;
	display:block;
	width:300px;
	height:100px
}
.sender{
	border:3px solid green;
	border-radius:5px 5px 0px 0px;
	border-bottom:none;
	width:300px;
	height:20px;
	left:5px;
	top:5px;
}
.receiver{
	border:3px solid green;
	display:block;
	width:300px;
	height:20px;
	left:5px;
	top:5px;
}
.date{
	border:3px solid green;
	border-top:none;
	display:block;
	width:300px;
	height:20px;
	left:5px;
	top:5px;
}
.content{
	border:3px solid green;
	border-top:none;
	border-radius:0px 0px 5px 5px;
	display:block;
	width:300px;
	height:60px;
	left:5px;
	top:5px;
	overflow-y:scroll;
}
.content::-webkit-scrollbar{
	 display: none; /* Chrome, Safari, Opera*/
}
.deleteBtn{
	position:absolute;
	border-radius:30px;
	background-color:red;
	color:white;
	left:312px;
	top:6px;
	width:20px;
	height:20px;
}
.deleteBtn:hover{
	background-color:#b81414;
}
.addBtn{
	position:absolute;
	border-radius:30px;
	background-color:blue;
	color:white;
	left:312px;
	top:6px;
	width:20px;
	height:20px;
}
.addBtn:hover{
	background-color:#0d4f75;
}
texarea{
	resize:none;
}
.send{
	width:300px;
	height:200px;
}
</style>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="message_container">
	<div class="side_menu">
	<ul class="all">
		 <li class="receive_icon"><button type="button" class="receive_box" onclick="messageList()">전체 쪽지함</button></li>
		<ul>
			<li class="receive_icon"><button type="button" class="receive_box" onclick="receiveMessageList()">받은 쪽지함</button></li>
			<li class="receive_icon"><button type="button" class="send_box" onclick="sendMessageList()">보낸 쪽지함</button></li>
		</ul>
	</ul>
	</div>
	<button type="button" class="send_button" onclick="sendMessagePage()">쪽지 보내기</button>
	<div class="show_container">
	</div>
</div>

</body>
</html>



<!-- <a href="https://www.flaticon.com/kr/free-icons/" title="편지 아이콘">편지 아이콘 제작자: Freepik - Flaticon</a> 
	<a href="https://www.flaticon.com/kr/free-icons/" title="접촉 아이콘">접촉 아이콘 제작자: Icongeek26 - Flaticon</a>-->