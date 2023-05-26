<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*, sec02.ex01.*"
    isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<jsp:useBean id="m" class="sec02.ex01.MemberBean" />
		<jsp:setProperty name="m" property="*" />
		<%
			MemberDAO memDAO = new MemberDAO();
		
			// 회원정보 추가
			memDAO.addMember(m);
			// 회원정보 조회
			List membersList = memDAO.listMembers();
			// 조회한 정보 request에 바인딩
			request.setAttribute("membersList", membersList);
		%>
	</head>
	<body>
		<jsp:forward page="memberList.jsp"/>
	</body>
</html>