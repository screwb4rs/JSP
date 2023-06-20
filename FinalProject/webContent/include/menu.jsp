<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메뉴</title>
</head>
<body>
	<ul>
	   	<li><a href="${contextPath}/member/movie.do">영화</a></li>
		<li><a href="#">극장</a></li>
		<li><a href="#">예매</a></li>
		<%
			if(session.getAttribute("sessionID") == null){
		%>
			<li><a href="../movieMember/loginForm.jsp">로그인</a></li>
			<li><a href="../movieMember/newMemberForm.jsp">회원가입</a></li>
		<%
			}
			else{
		%>
			<li><a href="../movieMember/logout.jsp">로그아웃</a></li>
		<%
			}
		%>
		<%
			if(session.getAttribute("sessionID") != null && session.getAttribute("sessionID").equals("admin")){
		%>
			<li><a href="${contextPath}/member/members.do">회원정보</a>
		<%
			}
		%>
	</ul>
</body>
</html>