<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>

<!-- 선언문 작성 -->
<%!
	String name = "김민오";
	public String getName(){
		return name;
	}
%>

<!-- 스크립트릿 작성 -->
<%
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>스크립트릿 연습 - 김민오</title>
	</head>
	<body>
				<!-- 표현식 -->
		<h1>안녕하세요. <%= name %>님!</h1>
		<h2>당신의 나이는 <%= age %>살입니다.</h2>
	</body>
</html>