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
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<c:set var="dan" value="${param.dan }"/>
		<table border='1' width=500 align=center>
			<tr align=center bgcolor="lightgreen">
				<td colspan=2>
					<c:out value="${dan }"/>단 출력
				</td>
			</tr>
			
			<c:forEach var="i" begin="1" end="9" step="1">
				<tr align="center">
					<td align="center" width="250">
						<c:out value="${dan }"/> * <c:out value="${i }"/>
					</td>
					<td align="center" width="250">
						<c:out value="${dan * i }"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>