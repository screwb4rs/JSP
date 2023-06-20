<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
<meta charset="UTF-8">
<title>영화 정보 수정창</title>
	<style>
	  .cls1 {
	     font-size:40px;
	     text-align:center;
	   }
	</style>
	</head>
	<body>
		 <h1 class="cls1">영화 정보 수정창</h1>
	<form  method="post" action="${contextPath}/member/modmovie.do?movie_num=${movInfo.movie_num}">
		<table align="center" >
			<tr>
				<td width="200"><p align="right" >번호</td>
				<td width="400"><input type="text" name="movie_num" value="${movInfo.movie_num}" disabled ></td>
		  	</tr>
			<tr>
			    <td width="200"><p align="right" >제목</td>
			    <td width="400"><input type="text" name="movie_name" value="${movInfo.movie_name}"></td>
			</tr>
			<tr>
				<td width="200"><p align="right" >내용</td>
				
				<td><textarea name="movie_content" cols="65" rows="10" maxlength="4000" >${movInfo.movie_content}</textarea></td>
			</tr>
			<tr>
				<td width="200"><p align="right" >작성자</td>
				<td width="400"><input type="text" name="member_id" value="${movInfo.member_id}" disabled ></td>
			</tr>
			<tr align="center" >
				<td colspan="2" width="400"><input type="submit" value="수정하기" >
			    <input type="reset" value="다시입력" > </td>
			</tr>
		</table>
	</form>
</html>
