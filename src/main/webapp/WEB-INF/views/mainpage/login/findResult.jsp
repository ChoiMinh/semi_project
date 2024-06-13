<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div>
<c:choose>
	<c:when test='${user_id!=null}'>
		<h3>찾으신 아이디는 ${user_id } 입니다.</h3>
	</c:when>
	<c:when test='${password!=null }'>
		<h3>찾으신 비밀번호는 ${password } 입니다.</h3>
	</c:when>
	<c:otherwise>
		<h3> 찾으시려는 정보가 없습니다. </h3>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>