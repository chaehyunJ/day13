<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header{
		position: fixed;
		top : 0;
		left : 0;
		width : 100%;
		padding : 10px;
		background-color: white;
		z-index: 1;
	}
	header + *{					/* 형제 노드를 찾을 때 사용하는 선택자, 지정한 요소 바로 다음 요소 */
		position: absolute;
		top : 120px;
	}
</style>

</head>
<body>
<script>
	const cpath = '${ cpath }'
</script>

<header>
	<h1><a href="${ cpath }">ajax fetch</a></h1>
	<hr>
</header>

