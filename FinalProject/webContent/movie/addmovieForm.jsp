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
		<title>영화추가</title>
		<script type="text/javascript">
			function home(){
		   		location.href="../HomePage/HomePage.jsp";
			}
		</script>
	</head>
	<body>
		<form method="post" action="${contextPath }/member/addmovie.do">
			<table align="center">
				<tr>
					<td align="left">번호</td>
					<td align="left">
						<input type="text" name="movie_num" size="67" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<td align="left">제목</td>
					<td align="left">
						<input type="text" name="movie_name" size="67" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<td align="left">내용</td>
					<td align="left">
						<textarea name="movie_content" cols="65" rows="10" maxlength="4000"></textarea>
					</td>
				</tr>
				<tr>
					<td align="left">작성자</td>
					<td align="left">
						<input type="text" name="member_id" size="67" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<td align="right"></td>
					<td><input type="submit" value="추가"/>
					<input type="button" value="취소" onclick="home()"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>