<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.root{
	margin-left:auto;
	margin-right:auto;
	width:1400px;
	height:1700px;
	border-width:1px;
	border-color:black;
	border-style:solid;
}
.header{
	margin:20px;
	width:1355px;
	height:150px;
	border-width:1px;
	border-color:black;
	border-style:solid;
}
.main_body{
	position:absolute;
	margin-left:20px;
	top:200px;
	width:944px;
	height:1480px;
	border-width:1px;
	border-color:black;
	border-style:solid;
}

.side_body{
	/* 요소를 추가하면 height auto때문에 자동으로 증가함 */
	position:absolute;
	margin-left:980px;
	width:400px;
	height:auto;
	border-width:1px;
	border-color:black;
	border-style:solid;
}

.side_body:nth-child(n){
	flex-direction:column
	flex-grow:1;
	border-width:1px;
	border-color:black;
	border-style:solid;
}

.side_menu{
	margin-top:20px;
	margin-left:20px;
	margin-bottom:20px;
	width:350px;
	/* 테스트를 위해서 height를 지정했음 나중에 사용시 auto로 변경*/
	height:160px;
	border-width:1px;
	border-color:black;
	border-style:solid;
}

a > h1{
	text-align:center;
}

</style>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<div class="root">
		<div class="header">
			<a class="header_hompage" href="/">
				<h1>홈페이지</h1>
			</a>
		</div>
		<div class="main_body">
			<h1>안녕하세요</h1>
			<h1>안녕하세요</h1>
			<h1>안녕하세요</h1>
			<h1>안녕하세요</h1>
			<h1>안녕하세요</h1>
		</div>
		<div class="side_body">
			<!--  테스트를 위해서 css height를 지정했음 나중에 내용 추가후 auto 로 변경 -->
			<div class="side_menu">
				<jsp:include page="home/beforeLoginWidget.jsp"></jsp:include>
			</div>
			<div class="side_menu"></div>
			<div class="side_menu"></div>
			<div class="side_menu"></div>
			<div class="side_menu"></div>
			<div class="side_menu"></div>
		</div>
	</div>
</body>
</html>