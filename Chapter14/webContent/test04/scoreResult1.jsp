<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:set var="score" value="${param.score }"/>
		<h1>시험점수
			<c:out value="${score }"/>
		</h1>
		<c:choose>
			<c:when test="${score > 100 || score < 0}">
				<h1>잘못된 점수입니다.</h1>
				<a href='scoreTest.jsp'>점수 입력 창으로 이동</a>
			</c:when>
			<c:when test="${score >= 90}">
				<h1>A학점입니다.</h1>
			</c:when>
			<c:when test="${score >= 80 }">
				<h1>B학점입니다.</h1>
			</c:when>
			<c:when test="${score >= 70 }">
				<h1>C학점입니다.</h1>
			</c:when>
			<c:when test="${score >= 60 }">
				<h1>D학점입니다.</h1>
			</c:when>
			<c:otherwise>
				<h1>F학점입니다.</h1>
			</c:otherwise>
		</c:choose>
	</body>
</html>