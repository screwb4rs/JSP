<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 값 받아오는 스크립 트릿 -->
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 결과</title>
	</head>
	<body>
		<h1>로그인 결과 출력</h1>
		<!-- 받아온 값 출력하는 표현식 -->
		<h2>아이디 : <%= id %></h2>
		<h2>비밀번호 : <%= pw %></h2>
	</body>
</html>